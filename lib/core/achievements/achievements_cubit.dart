import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AchievementId {
  sevenDaysNoOverspend,
  oneMonthInPlus,
  tenTasksDone,
}

class Achievement {
  const Achievement({
    required this.id,
    required this.progress,
    required this.target,
    required this.unlocked,
  });

  final AchievementId id;
  final int progress;
  final int target;
  final bool unlocked;

  Achievement copyWith({
    int? progress,
    int? target,
    bool? unlocked,
  }) {
    return Achievement(
      id: id,
      progress: progress ?? this.progress,
      target: target ?? this.target,
      unlocked: unlocked ?? this.unlocked,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id.name,
        'progress': progress,
        'target': target,
        'unlocked': unlocked,
      };

  static Achievement fromJson(Map<String, dynamic> json) {
    final idName = json['id'] as String;
    final id = AchievementId.values.firstWhere(
      (e) => e.name == idName,
      orElse: () => AchievementId.sevenDaysNoOverspend,
    );
    return Achievement(
      id: id,
      progress: (json['progress'] as num?)?.toInt() ?? 0,
      target: (json['target'] as num?)?.toInt() ?? 0,
      unlocked: json['unlocked'] as bool? ?? false,
    );
  }
}

class AchievementsState {
  const AchievementsState({
    required this.achievements,
    this.transactionStreakDays = 0,
    this.lastTransactionDate,
    this.justBrokeTransactionStreak = false,
  });

  final List<Achievement> achievements;
  final int transactionStreakDays;
  final DateTime? lastTransactionDate;
  final bool justBrokeTransactionStreak;

  AchievementsState copyWith({
    List<Achievement>? achievements,
    int? transactionStreakDays,
    DateTime? lastTransactionDate,
    bool? justBrokeTransactionStreak,
  }) {
    return AchievementsState(
      achievements: achievements ?? this.achievements,
      transactionStreakDays:
          transactionStreakDays ?? this.transactionStreakDays,
      lastTransactionDate: lastTransactionDate ?? this.lastTransactionDate,
      justBrokeTransactionStreak:
          justBrokeTransactionStreak ?? this.justBrokeTransactionStreak,
    );
  }

  Map<String, dynamic> toJson() => {
        'achievements': achievements.map((e) => e.toJson()).toList(),
        'transactionStreakDays': transactionStreakDays,
        'lastTransactionDate': lastTransactionDate?.toIso8601String(),
      };

  static AchievementsState fromJson(Map<String, dynamic> json) {
    final list = (json['achievements'] as List<dynamic>?)
            ?.map((e) => Achievement.fromJson(
                  e as Map<String, dynamic>,
                ))
            .toList() ??
        _initialAchievements;

    DateTime? lastDate;
    final lastRaw = json['lastTransactionDate'] as String?;
    if (lastRaw != null) {
      lastDate = DateTime.tryParse(lastRaw);
    }

    return AchievementsState(
      achievements: list,
      transactionStreakDays:
          (json['transactionStreakDays'] as num?)?.toInt() ?? 0,
      lastTransactionDate: lastDate,
    );
  }

  static List<Achievement> get _initialAchievements => const [
        Achievement(
          id: AchievementId.sevenDaysNoOverspend,
          progress: 0,
          target: 7,
          unlocked: false,
        ),
        Achievement(
          id: AchievementId.oneMonthInPlus,
          progress: 0,
          target: 30,
          unlocked: false,
        ),
        Achievement(
          id: AchievementId.tenTasksDone,
          progress: 0,
          target: 10,
          unlocked: false,
        ),
      ];
}

class AchievementsCubit extends Cubit<AchievementsState> {
  AchievementsCubit()
      : super(
          AchievementsState(achievements: AchievementsState._initialAchievements),
        ) {
    _load();
  }

  static const _prefsKey = 'achievements_state';

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_prefsKey);
    if (raw == null) return;

    try {
      final map = jsonDecode(raw) as Map<String, dynamic>;
      emit(AchievementsState.fromJson(map));
    } catch (_) {
      // ignore corrupted state
    }
  }

  Future<void> _save(AchievementsState state) async {
    emit(state);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefsKey, jsonEncode(state.toJson()));
  }

  /// Should be called once on app start.
  Future<void> checkStreaksOnAppStart() async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final last = state.lastTransactionDate;

    if (last == null) return;

    final lastDate = DateTime(last.year, last.month, last.day);
    final diff = today.difference(lastDate).inDays;

    if (diff > 1 && state.transactionStreakDays > 0) {
      final updated = state.copyWith(
        transactionStreakDays: 0,
        justBrokeTransactionStreak: true,
      );
      await _save(updated);
    }
  }

  Future<void> acknowledgeStreakBreak() async {
    if (!state.justBrokeTransactionStreak) return;
    await _save(state.copyWith(justBrokeTransactionStreak: false));
  }

  /// Call when a new transaction is added.
  Future<void> onTransactionAdded(DateTime date) async {
    final today = DateTime(date.year, date.month, date.day);
    final last = state.lastTransactionDate;

    int streak = state.transactionStreakDays;
    if (last == null) {
      streak = 1;
    } else {
      final lastDate = DateTime(last.year, last.month, last.day);
      final diff = today.difference(lastDate).inDays;
      if (diff == 0) {
        // already counted today
      } else if (diff == 1) {
        streak += 1;
      } else if (diff > 1) {
        streak = 1;
      }
    }

    await _save(
      state.copyWith(
        transactionStreakDays: streak,
        lastTransactionDate: today,
        justBrokeTransactionStreak: false,
      ),
    );
  }

  /// Call when tasks list changes to update "10 tasks done" achievement.
  Future<void> onTasksUpdated(List<Map<String, dynamic>> tasks) async {
    final completed =
        tasks.where((t) => t['status'] == 'done').length;

    final updatedList = state.achievements.map((a) {
      if (a.id == AchievementId.tenTasksDone) {
        final newProgress = completed.clamp(0, a.target);
        return a.copyWith(
          progress: newProgress,
          unlocked: newProgress >= a.target,
        );
      }
      return a;
    }).toList();

    await _save(state.copyWith(achievements: updatedList));
  }
}


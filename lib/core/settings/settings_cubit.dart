import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsState {
  const SettingsState({
    this.fontScale = 1.0,
    this.fontFamily = AppFontFamily.inter,
    this.notificationsEnabled = false,
    this.notificationTime,
  });

  final double fontScale;
  final AppFontFamily fontFamily;
  final bool notificationsEnabled;
  final TimeOfDay? notificationTime;

  SettingsState copyWith({
    double? fontScale,
    AppFontFamily? fontFamily,
    bool? notificationsEnabled,
    TimeOfDay? notificationTime,
  }) {
    return SettingsState(
      fontScale: fontScale ?? this.fontScale,
      fontFamily: fontFamily ?? this.fontFamily,
      notificationsEnabled:
          notificationsEnabled ?? this.notificationsEnabled,
      notificationTime: notificationTime ?? this.notificationTime,
    );
  }

  Map<String, dynamic> toJson() => {
        'fontScale': fontScale,
        'fontFamily': fontFamily.name,
        'notificationsEnabled': notificationsEnabled,
        'notificationTime': notificationTime == null
            ? null
            : {
                'hour': notificationTime!.hour,
                'minute': notificationTime!.minute,
              },
      };

  static SettingsState fromJson(Map<String, dynamic> json) {
    final fontFamilyName =
        (json['fontFamily'] as String?) ?? AppFontFamily.inter.name;
    final family = AppFontFamily.values.firstWhere(
      (e) => e.name == fontFamilyName,
      orElse: () => AppFontFamily.inter,
    );

    final timeJson = json['notificationTime'];
    TimeOfDay? time;
    if (timeJson is Map<String, dynamic>) {
      final hour = timeJson['hour'] as int?;
      final minute = timeJson['minute'] as int?;
      if (hour != null && minute != null) {
        time = TimeOfDay(hour: hour, minute: minute);
      }
    }

    return SettingsState(
      fontScale: (json['fontScale'] as num?)?.toDouble() ?? 1.0,
      fontFamily: family,
      notificationsEnabled: json['notificationsEnabled'] as bool? ?? false,
      notificationTime: time,
    );
  }
}

enum AppFontFamily { inter, roboto, montserrat }

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(const SettingsState()) {
    _load();
  }

  static const _prefsKey = 'app_settings';

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_prefsKey);
    if (raw == null) return;

    try {
      final map = jsonDecode(raw) as Map<String, dynamic>;
      emit(SettingsState.fromJson(map));
    } catch (_) {
      // ignore corrupted state
    }
  }

  Future<void> _save(SettingsState state) async {
    emit(state);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefsKey, jsonEncode(state.toJson()));
  }

  Future<void> setFontScale(double scale) async {
    final clamped = scale.clamp(0.8, 1.4);
    await _save(state.copyWith(fontScale: clamped));
  }

  Future<void> setFontFamily(AppFontFamily family) async {
    await _save(state.copyWith(fontFamily: family));
  }

  Future<void> setNotificationsEnabled(bool enabled) async {
    await _save(
      state.copyWith(
        notificationsEnabled: enabled,
        notificationTime: enabled ? (state.notificationTime) : null,
      ),
    );
  }

  Future<void> setNotificationTime(TimeOfDay time) async {
    await _save(
      state.copyWith(
        notificationsEnabled: true,
        notificationTime: time,
      ),
    );
  }
}


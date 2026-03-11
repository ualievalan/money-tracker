import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/core/achievements/achievements_cubit.dart';
import 'package:money_tracker/core/localization/app_localizations.dart';

class AchievementsBottomSheet {
  static Future<void> show(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        final loc = AppLocalizations.of(context);

        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: SingleChildScrollView(
              child: BlocBuilder<AchievementsCubit, AchievementsState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 40,
                          height: 4,
                          margin: const EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                      Text(
                        loc.achievementsTitle,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        loc.achievementsSubtitle,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _AchievementTile(
                        icon: Icons.local_fire_department_rounded,
                        color: Colors.orange,
                        title: loc.achievementSevenDaysNoOverspendTitle,
                        subtitle:
                            loc.achievementSevenDaysNoOverspendSubtitle,
                        progress: state.achievements
                                .firstWhere(
                                  (a) =>
                                      a.id ==
                                      AchievementId.sevenDaysNoOverspend,
                                )
                                .progress ??
                            0,
                        target: state.achievements
                                .firstWhere(
                                  (a) =>
                                      a.id ==
                                      AchievementId.sevenDaysNoOverspend,
                                )
                                .target ??
                            7,
                      ),
                      _AchievementTile(
                        icon: Icons.star_rounded,
                        color: Colors.blueAccent,
                        title: loc.achievementOneMonthInPlusTitle,
                        subtitle: loc.achievementOneMonthInPlusSubtitle,
                        progress: state.achievements
                                .firstWhere(
                                  (a) =>
                                      a.id == AchievementId.oneMonthInPlus,
                                )
                                .progress ??
                            0,
                        target: state.achievements
                                .firstWhere(
                                  (a) =>
                                      a.id == AchievementId.oneMonthInPlus,
                                )
                                .target ??
                            30,
                      ),
                      _AchievementTile(
                        icon: Icons.check_circle_rounded,
                        color: Colors.green,
                        title: loc.achievementTenTasksTitle,
                        subtitle: loc.achievementTenTasksSubtitle,
                        progress: state.achievements
                                .firstWhere(
                                  (a) =>
                                      a.id == AchievementId.tenTasksDone,
                                )
                                .progress ??
                            0,
                        target: state.achievements
                                .firstWhere(
                                  (a) =>
                                      a.id == AchievementId.tenTasksDone,
                                )
                                .target ??
                            10,
                      ),
                      const SizedBox(height: 16),
                      ListTile(
                        leading: const Icon(Icons.local_fire_department),
                        title: Text(loc.transactionStreakTitle),
                        subtitle: Text(
                          loc.transactionStreakSubtitle(
                            state.transactionStreakDays,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class _AchievementTile extends StatelessWidget {
  const _AchievementTile({
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.progress,
    required this.target,
  });

  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;
  final int progress;
  final int target;

  @override
  Widget build(BuildContext context) {
    final clampedProgress = progress.clamp(0, target);
    final percent =
        target == 0 ? 0.0 : clampedProgress / target;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 6),
                ClipRRect(
                  borderRadius: BorderRadius.circular(999),
                  child: LinearProgressIndicator(
                    value: percent,
                    backgroundColor:
                        Colors.grey.shade300.withValues(alpha: 0.5),
                    valueColor:
                        AlwaysStoppedAnimation<Color>(color),
                    minHeight: 6,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '$clampedProgress/$target',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/core/localization/app_localizations.dart';
import 'package:money_tracker/core/settings/settings_cubit.dart';
import 'package:money_tracker/features/settings/presentation/screen/change_password_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.settings),
      ),
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          final cubit = context.read<SettingsCubit>();

          String notificationLabel;
          if (!state.notificationsEnabled || state.notificationTime == null) {
            notificationLabel = loc.notificationsOff;
          } else {
            final t = state.notificationTime!;
            final hh = t.hour.toString().padLeft(2, '0');
            final mm = t.minute.toString().padLeft(2, '0');
            notificationLabel = '$hh:$mm';
          }

          return ListView(
            children: [
              ListTile(
                title: Text(
                  loc.security,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.lock),
                title: Text(loc.changePassword),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (_) => const ChangePasswordScreen(),
                    ),
                  );
                },
              ),
              const Divider(),
              ListTile(
                title: Text(
                  loc.fontSize,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Slider(
                value: state.fontScale,
                min: 0.8,
                max: 1.4,
                divisions: 6,
                label: state.fontScale.toStringAsFixed(2),
                onChanged: (value) {
                  cubit.setFontScale(value);
                },
              ),
              ListTile(
                title: Text(
                  loc.fontFamily,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              RadioListTile<AppFontFamily>(
                title: const Text('Inter'),
                value: AppFontFamily.inter,
                groupValue: state.fontFamily,
                onChanged: (value) {
                  if (value != null) cubit.setFontFamily(value);
                },
              ),
              RadioListTile<AppFontFamily>(
                title: const Text('Roboto'),
                value: AppFontFamily.roboto,
                groupValue: state.fontFamily,
                onChanged: (value) {
                  if (value != null) cubit.setFontFamily(value);
                },
              ),
              RadioListTile<AppFontFamily>(
                title: const Text('Montserrat'),
                value: AppFontFamily.montserrat,
                groupValue: state.fontFamily,
                onChanged: (value) {
                  if (value != null) cubit.setFontFamily(value);
                },
              ),
              const Divider(),
              ListTile(
                title: Text(
                  loc.notifications,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SwitchListTile(
                title: Text(loc.notificationsEnable),
                value: state.notificationsEnabled,
                onChanged: (value) {
                  cubit.setNotificationsEnabled(value);
                },
              ),
              ListTile(
                leading: const Icon(Icons.access_time),
                title: Text(loc.notificationsTime),
                subtitle: Text(notificationLabel),
                enabled: state.notificationsEnabled,
                onTap: !state.notificationsEnabled
                    ? null
                    : () async {
                        final now = TimeOfDay.now();
                        final initial = state.notificationTime ?? now;
                        final picked = await showTimePicker(
                          context: context,
                          initialTime: initial,
                        );
                        if (picked != null) {
                          cubit.setNotificationTime(picked);
                        }
                      },
              ),
            ],
          );
        },
      ),
    );
  }
}


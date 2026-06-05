import 'package:flutter/material.dart';
import 'package:money_tracker/core/error/failure.dart';

class StartupFailureScreen extends StatelessWidget {
  const StartupFailureScreen({super.key, required this.failure});

  final Failure failure;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.settings_rounded,
                  size: 48,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(height: 20),
                Text(
                  'App configuration required',
                  style: theme.textTheme.displayMedium,
                ),
                const SizedBox(height: 12),
                Text(failure.message, style: theme.textTheme.bodyLarge),
                const SizedBox(height: 24),
                Text(
                  'To open the full app, update your .env file with:',
                  style: theme.textTheme.bodyLarge,
                ),
                const SizedBox(height: 12),
                const _EnvKeyChip(label: 'SUPABASE_URL'),
                const SizedBox(height: 8),
                const _EnvKeyChip(label: 'SUPABASE_ANON_KEY'),
                const SizedBox(height: 24),
                Text(
                  'The simulator is working. Once the environment values are added, rerun the app.',
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _EnvKeyChip extends StatelessWidget {
  const _EnvKeyChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Text(
        label,
        style: Theme.of(
          context,
        ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }
}

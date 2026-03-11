import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:money_tracker/core/localization/app_localizations.dart';

class WelcomeScreen extends StatelessWidget {
  final VoidCallback? onGetStarted;

  const WelcomeScreen({super.key, this.onGetStarted});
  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),

              Text(loc.welcomeHello, style: theme.textTheme.displayLarge)
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 200.ms)
                  .slideY(begin: 0.3, end: 0, duration: 600.ms, delay: 200.ms),

              const SizedBox(height: 16),

              Text(
                    loc.welcomeTitle,
                    style: theme.textTheme.displayMedium?.copyWith(
                      color: isDark
                          ? Colors.white.withValues(alpha: 0.7)
                          : Colors.black.withValues(alpha: 0.7),
                    ),
                  )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 400.ms)
                  .slideY(begin: 0.3, end: 0, duration: 600.ms, delay: 400.ms),

              const SizedBox(height: 32),

              Text(
                    loc.welcomeSubtitle,
                    style: theme.textTheme.bodyMedium,
                  )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 600.ms)
                  .slideY(begin: 0.3, end: 0, duration: 600.ms, delay: 600.ms),

              const Spacer(),

              SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: onGetStarted,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.primary,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: Text(
                        loc.getStarted,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 800.ms)
                  .slideY(begin: 0.3, end: 0, duration: 600.ms, delay: 800.ms)
                  .shimmer(delay: 1400.ms, duration: 1200.ms),

              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }
}

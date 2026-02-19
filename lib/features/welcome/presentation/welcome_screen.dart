import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
class WelcomeScreen extends StatelessWidget {
  final VoidCallback? onGetStarted;
  
  const WelcomeScreen({super.key, this.onGetStarted});
  @override
  Widget build(BuildContext context) {
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
              
              
              Text(
                'Привет 👋',
                style: theme.textTheme.displayLarge,
              )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 200.ms)
                  .slideY(begin: 0.3, end: 0, duration: 600.ms, delay: 200.ms),
              
              const SizedBox(height: 16),
              
              
              Text(
                'Добро пожаловать в\nMoney Tracker',
                style: theme.textTheme.displayMedium?.copyWith(
                  color: isDark 
                      ? Colors.white.withOpacity(0.7) 
                      : Colors.black.withOpacity(0.7),
                ),
              )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 400.ms)
                  .slideY(begin: 0.3, end: 0, duration: 600.ms, delay: 400.ms),
              
              const SizedBox(height: 32),
              
              
              Text(
                'Управляйте своими финансами\nлегко и эффективно',
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
                  child: const Text(
                    'Начать',
                    style: TextStyle(
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

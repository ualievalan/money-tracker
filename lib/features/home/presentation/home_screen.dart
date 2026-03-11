import 'package:flutter/material.dart';
import 'package:money_tracker/core/localization/app_localizations.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final loc = AppLocalizations.of(context);
    
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                loc.home,
                style: theme.textTheme.displayMedium,
              ),
              const SizedBox(height: 24),
              
              
              Expanded(
                child: Center(
                  child: Text(
                    loc.homePlaceholder,
                    style: theme.textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

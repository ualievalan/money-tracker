import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/welcome/presentation/welcome_screen.dart';
import 'main_screen.dart';
import 'features/transactions/data /transactions_storage.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TransactionsStorage.load();
  runApp(const MoneyTrackerApp());
}


class MoneyTrackerApp extends StatelessWidget {
  const MoneyTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Tracker',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const AppNavigator(),
    );
  }
}

class AppNavigator extends StatefulWidget {
  const AppNavigator({super.key});

  @override
  State<AppNavigator> createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {
  bool _showWelcome = true;

  @override
  Widget build(BuildContext context) {
    if (_showWelcome) {
      return WelcomeScreen(
        onGetStarted: () {
          setState(() {
            _showWelcome = false;
          });
        },
      );
    }
    return const MainScreen();
  }
}

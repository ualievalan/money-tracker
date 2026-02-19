import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/core/theme/app_theme.dart';
import 'package:money_tracker/features/auth/login_page.dart';
import 'package:money_tracker/features/transactions/data%20/transactions_storage.dart';
import 'package:money_tracker/features/welcome/presentation/welcome_screen.dart';
import 'package:money_tracker/firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await TransactionsStorage.load();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
    
    return const LoginPage(); 
  }
}

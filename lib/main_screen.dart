import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_tracker/features/home/presentation/home_screen.dart';
import 'package:money_tracker/features/tasks/presentation/screen/tasks_screen.dart';
import 'package:money_tracker/features/transactions/presentation/transactions_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  late final List<Widget> _screens;
  @override
  void initState() {
    super.initState();
    _screens = [
      Scaffold(
        appBar: AppBar(title: const Text("Главная")),
        body: const HomeScreen(),
      ),
       Scaffold(
        appBar: AppBar(title: const Text("Дела")),
        body: const TasksScreen(),
      ),
      const TransactionsScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: isDark
                  ? Colors.white.withOpacity(0.1)
                  : Colors.black.withOpacity(0.1),
              width: 0.5,
            ),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            HapticFeedback.lightImpact();
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Главная',
            ),
            BottomNavigationBarItem(icon: 
            Icon(Icons.task),label: 'Дела'),

            BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long_rounded),
              label: 'Транзакции',
            ),
          ],
        ),
      ),
    );
  }
}

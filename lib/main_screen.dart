import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/bottom_navigation_bar.dart';
import 'package:money_tracker/core/theme/theme_cubit.dart';
import 'package:money_tracker/features/tasks/presentation/screen/tasks_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'features/home/presentation/home_screen.dart';
import 'features/transactions/presentation/transactions_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const TasksScreen(),
    const TransactionsScreen(),
  ];

  void _showEditNameDialog() {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Введите имя'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Ваше имя'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Отмена'),
            ),
            ElevatedButton(
              onPressed: () async {
                final name = controller.text.trim();
                if (name.isNotEmpty) {
                  await Supabase.instance.client.auth.updateUser(
                    UserAttributes(data: {'firstName': name}),
                  );

                  if (!mounted) return;

                  setState(() {});
                  Navigator.pop(context);
                }
              },
              child: const Text('Сохранить'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Supabase.instance.client.auth.currentUser;
    if (user == null) {
      return const SizedBox.shrink();
    }

    final firstName = user.userMetadata?['firstName'] ?? '';
    final lastName = user.userMetadata?['lastName'] ?? '';
    final email = user.email ?? '';
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isDarkMode =
        context.watch<ThemeCubit>().state == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(_currentIndex == 0 ? 'Главная' : 'Транзакции'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('$firstName $lastName'),
              accountEmail: Text(email),
              currentAccountPicture: CircleAvatar(
                child: Text(
                  firstName.isNotEmpty ? firstName[0] : '',
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home_rounded),
              title: const Text('Главная'),
              onTap: () {
                HapticFeedback.lightImpact();
                setState(() => _currentIndex = 0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.receipt_long_rounded),
              title: const Text('Транзакции'),
              onTap: () {
                HapticFeedback.lightImpact();
                setState(() => _currentIndex = 1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Изменить имя'),
              onTap: () {
                Navigator.pop(context);
                _showEditNameDialog();
              },
            ),
            SwitchListTile(
              secondary: const Icon(Icons.dark_mode),
              title: const Text('Тёмная тема'),
              value: isDarkMode,
              onChanged: (value) {
                HapticFeedback.lightImpact();
                context.read<ThemeCubit>().toggle(value);
              },
            ),
            const Spacer(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Выйти'),
              onTap: () async {
                await Supabase.instance.client.auth.signOut();

                if (!mounted) return;

                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/login',
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
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
        child: AppleBottomNavBar(
          currentIndex: _currentIndex,
          isDark: isDark,
          onTap: (index) {
            HapticFeedback.lightImpact();
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}

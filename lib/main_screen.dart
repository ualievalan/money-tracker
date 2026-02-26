import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
<<<<<<< HEAD
<<<<<<< HEAD
=======
import 'package:supabase_flutter/supabase_flutter.dart';
>>>>>>> 999d85e (Resolve merge conflict in main_screen)
import 'package:money_tracker/bottom_navigation_bar.dart';
import 'package:money_tracker/features/home/presentation/home_screen.dart';
import 'package:money_tracker/features/tasks/presentation/screen/tasks_screen.dart';
import 'package:money_tracker/features/transactions/presentation/transactions_screen.dart';
=======
import 'package:supabase_flutter/supabase_flutter.dart';
import 'features/home/presentation/home_screen.dart';
import 'features/transactions/presentation/transactions_screen.dart';
>>>>>>> 8dc2aac (Исправлен MainScreen: безопасный logout и Supabase user)

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
<<<<<<< HEAD
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
=======

  final List<Widget> _screens = [
    const HomeScreen(),
    const TransactionsScreen(),
  ];
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 8dc2aac (Исправлен MainScreen: безопасный logout и Supabase user)
=======
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

<<<<<<< HEAD
                setState(() {}); // обновляем UI
                Navigator.pop(context); // закрываем диалог
              }
            },
            child: const Text('Сохранить'),
          ),
        ],
      );
    },
  );
}
>>>>>>> be7559e (Add burger menu with editable user name)
=======
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
>>>>>>> d69ea23 (Сохранил изменения перед мержем main)
=======
>>>>>>> 999d85e (Resolve merge conflict in main_screen)

  @override
  Widget build(BuildContext context) {
    final user = Supabase.instance.client.auth.currentUser;
    if (user == null) {
      return const SizedBox.shrink();
    }

    final isDark = Theme.of(context).brightness == Brightness.dark;

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
                  firstName.isNotEmpty
                      ? firstName[0]
                      : ' ', // пустой пробел вместо '?'
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            ),
<<<<<<< HEAD
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
=======
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
>>>>>>> 8dc2aac (Исправлен MainScreen: безопасный logout и Supabase user)
        ),
      ),
    );
  }
}

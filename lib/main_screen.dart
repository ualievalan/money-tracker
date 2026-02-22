import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
<<<<<<< HEAD
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
          decoration: const InputDecoration(
            hintText: 'Ваше имя',
          ),
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
                // Сохраняем имя в Supabase
                await Supabase.instance.client.auth.updateUser(
                  UserAttributes(data: {'firstName': name}),
                );

                if (!mounted) return;

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

  @override
  Widget build(BuildContext context) {
    // Берём пользователя напрямую из Supabase
    final user = Supabase.instance.client.auth.currentUser;

    // Если пользователь не авторизован — редирект на /login
    if (user == null) {
  return const SizedBox.shrink();
}

    // Получаем данные из userMetadata
    final firstName = user.userMetadata?['firstName'] as String? ?? '';
    final lastName = user.userMetadata?['lastName'] as String? ?? '';
    final email = user.email ?? '';

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
                  firstName.isNotEmpty ? firstName[0] : '?',
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            ),
<<<<<<< HEAD
          ),
        ),
        child: AppleBottomNavBar(
          currentIndex: _currentIndex,
          isDark: true,
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
    Navigator.pop(context); // закрываем Drawer
    _showEditNameDialog();   // вызываем диалог
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
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'Транзакции'),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/bottom_navigation_bar.dart';
import 'package:money_tracker/core/localization/app_localizations.dart';
import 'package:money_tracker/core/localization/locale_cubit.dart';
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
        final loc = AppLocalizations.of(context);
        return AlertDialog(
          title: Text(loc.enterName),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: loc.yourName),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(loc.cancel),
            ),
            ElevatedButton(
              onPressed: () async {
                final name = controller.text.trim();
                if (name.isNotEmpty) {
                  await Supabase.instance.client.auth.updateUser(
                    UserAttributes(data: {'firstName': name}),
                  );

                  if (!context.mounted) return;

                  setState(() {});
                  Navigator.pop(context);
                }
              },
              child: Text(loc.save),
            ),
          ],
        );
      },
    );
  }

  void _showLanguageBottomSheet(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final localeCubit = context.read<LocaleCubit>();
    final currentCode = localeCubit.state.languageCode;

    showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(
                  loc.selectLanguage,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              RadioListTile<String>(
                value: 'ru',
                groupValue: currentCode,
                title: Text(loc.languageRussian),
                onChanged: (value) {
                  if (value == null) return;
                  localeCubit.setLocale(const Locale('ru'));
                  Navigator.pop(context);
                },
              ),
              RadioListTile<String>(
                value: 'kk',
                groupValue: currentCode,
                title: Text(loc.languageKazakh),
                onChanged: (value) {
                  if (value == null) return;
                  localeCubit.setLocale(const Locale('kk'));
                  Navigator.pop(context);
                },
              ),
              RadioListTile<String>(
                value: 'en',
                groupValue: currentCode,
                title: Text(loc.languageEnglish),
                onChanged: (value) {
                  if (value == null) return;
                  localeCubit.setLocale(const Locale('en'));
                  Navigator.pop(context);
                },
              ),
            ],
          ),
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

    final loc = AppLocalizations.of(context);

    final firstName = user.userMetadata?['firstName'] ?? '';
    final lastName = user.userMetadata?['lastName'] ?? '';
    final email = user.email ?? '';
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isDarkMode =
        context.watch<ThemeCubit>().state == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          switch (_currentIndex) {
            0 => loc.home,
            1 => loc.tasks,
            _ => loc.transactions,
          },
        ),
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
              title: Text(loc.home),
              onTap: () {
                HapticFeedback.lightImpact();
                setState(() => _currentIndex = 0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.receipt_long_rounded),
              title: Text(loc.transactions),
              onTap: () {
                HapticFeedback.lightImpact();
                setState(() => _currentIndex = 1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: Text(loc.changeName),
              onTap: () {
                Navigator.pop(context);
                _showEditNameDialog();
              },
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: Text(loc.language),
              onTap: () {
                Navigator.pop(context);
                _showLanguageBottomSheet(context);
              },
            ),
            SwitchListTile(
              secondary: const Icon(Icons.dark_mode),
              title: Text(loc.darkTheme),
              value: isDarkMode,
              onChanged: (value) {
                HapticFeedback.lightImpact();
                context.read<ThemeCubit>().toggle(value);
              },
            ),
            const Spacer(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: Text(loc.logout),
              onTap: () async {
                await Supabase.instance.client.auth.signOut();

                if (!context.mounted) return;

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
                  ? Colors.white.withValues(alpha: 0.1)
                  : Colors.black.withValues(alpha: 0.1),
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

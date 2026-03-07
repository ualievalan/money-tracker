import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/bottom_navigation_bar.dart';
import 'package:money_tracker/core/localization/app_localizations.dart';
import 'package:money_tracker/core/localization/locale_cubit.dart';
import 'package:money_tracker/core/theme/theme_cubit.dart';
import 'package:money_tracker/features/home/presentation/home_screen.dart';
import 'package:money_tracker/features/settings/presentation/screen/settings_screen.dart';
import 'package:money_tracker/features/tasks/presentation/screen/tasks_screen.dart';
import 'package:money_tracker/features/transactions/presentation/transactions_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  late final PageController _pageController;

  final List<Widget> _screens = [
    const HomeScreen(),
    const TasksScreen(),
    const TransactionsScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
    final isDarkMode = context.watch<ThemeCubit>().state == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _currentIndex == 0
              ? loc.home
              : (_currentIndex == 1 ? loc.tasks : loc.transactions),
        ),
      ),
      drawer: Drawer(
        backgroundColor: isDark
            ? const Color(0xFF1C1C1E)
            : const Color(0xFFF2F2F7),
        elevation: 0,
        child: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Container(
                      height: 56,
                      width: 56,
                      decoration: BoxDecoration(
                        color: isDark ? Colors.grey.shade800 : Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          if (!isDark)
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        firstName.isNotEmpty ? firstName[0].toUpperCase() : '?',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            firstName.isNotEmpty
                                ? '$firstName $lastName'.trim()
                                : 'Пользователь',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.5,
                              color: isDark ? Colors.white : Colors.black,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            email,
                            style: TextStyle(
                              fontSize: 14,
                              color: isDark
                                  ? Colors.grey.shade400
                                  : Colors.grey.shade600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: isDark ? const Color(0xFF2C2C2E) : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      _buildDrawerItem(
                        icon: Icons.home_rounded,
                        title: loc.home,
                        isDark: isDark,
                        onTap: () {
                          HapticFeedback.lightImpact();
                          _pageController.animateToPage(
                            0,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                          Navigator.pop(context);
                        },
                      ),
                      _buildDivider(isDark),
                      _buildDrawerItem(
                        icon: Icons.check_circle_outline_rounded,
                        title: loc.tasks,
                        isDark: isDark,
                        onTap: () {
                          HapticFeedback.lightImpact();
                          _pageController.animateToPage(
                            1,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                          Navigator.pop(context);
                        },
                      ),
                      _buildDivider(isDark),
                      _buildDrawerItem(
                        icon: Icons.receipt_long_rounded,
                        title: loc.transactions,
                        isDark: isDark,
                        onTap: () {
                          HapticFeedback.lightImpact();
                          _pageController.animateToPage(
                            2,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                          Navigator.pop(context);
                        },
                      ),
                      _buildDivider(isDark),
                      _buildDrawerItem(
                        icon: Icons.edit_rounded,
                        title: loc.changeName,
                        isDark: isDark,
                        onTap: () {
                          Navigator.pop(context);
                          _showEditNameDialog();
                        },
                      ),
                      _buildDivider(isDark),
                      _buildDrawerItem(
                        icon: Icons.language_rounded,
                        title: loc.language,
                        isDark: isDark,
                        onTap: () {
                          Navigator.pop(context);
                          _showLanguageBottomSheet(context);
                        },
                      ),
                      _buildDivider(isDark),
                      _buildDrawerItem(
                        icon: Icons.settings_rounded,
                        title: loc.settings,
                        isDark: isDark,
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (_) => const SettingsScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: isDark ? const Color(0xFF2C2C2E) : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 8,
                          top: 4,
                          bottom: 4,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.dark_mode_rounded,
                                  color: isDark ? Colors.white : Colors.black87,
                                  size: 22,
                                ),
                                const SizedBox(width: 16),
                                Text(
                                  loc.darkTheme,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: isDark
                                        ? Colors.white
                                        : Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                            Switch.adaptive(
                              value: isDarkMode,
                              activeColor: Colors.black,
                              activeTrackColor: isDark
                                  ? Colors.white
                                  : Colors.green,
                              onChanged: (value) {
                                HapticFeedback.lightImpact();
                                context.read<ThemeCubit>().toggle(value);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 24,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: isDark ? const Color(0xFF2C2C2E) : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: _buildDrawerItem(
                    icon: Icons.logout_rounded,
                    title: loc.logout,
                    isDark: isDark,
                    isDestructive: true,
                    hideChevron: true,
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
                ),
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        physics: const ClampingScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: _screens,
      ),
      bottomNavigationBar: AppleBottomNavBar(
        currentIndex: _currentIndex,
        isDark: isDark,
        onTap: (index) {
          HapticFeedback.lightImpact();
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    required bool isDark,
    bool isDestructive = false,
    bool hideChevron = false,
  }) {
    final color = isDestructive
        ? Colors.redAccent
        : (isDark ? Colors.white : Colors.black87);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Icon(icon, color: color, size: 22),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: color,
                ),
              ),
            ),
            if (!hideChevron)
              Icon(
                Icons.chevron_right_rounded,
                color: isDark ? Colors.grey.shade600 : Colors.grey.shade400,
                size: 20,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider(bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(left: 54),
      child: Divider(
        height: 1,
        thickness: 0.5,
        color: isDark
            ? Colors.white.withValues(alpha: 0.1)
            : Colors.black.withValues(alpha: 0.05),
      ),
    );
  }
}

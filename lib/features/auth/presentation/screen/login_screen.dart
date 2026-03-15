import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/core/localization/app_localizations.dart';
import 'package:money_tracker/features/auth/presentation/login_theme.dart';
import 'package:money_tracker/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:money_tracker/features/auth/presentation/bloc/auth_event.dart';
import 'package:money_tracker/features/auth/presentation/bloc/auth_state.dart';
import 'package:money_tracker/features/auth/presentation/widgets/google_icon.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

// Layout constants for consistency and responsiveness.
const double _kHorizontalPadding = 24;
const double _kVerticalPadding = 32;
const double _kSpacingSmall = 8;
const double _kSpacingMedium = 16;
const double _kSpacingLarge = 32;
const double _kSpacingXLarge = 40;
const double _kSpacingHeader = 48;
const double _kButtonMinHeight = 48;
const double _kBottomExtraPadding = 24;

/// Login / Sign-up page. Responsive layout with no overflow.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isSignUp = false;
  int _themeIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadSavedTheme();
  }

  /// Load saved theme so it applies when entering the app (and after restart).
  Future<void> _loadSavedTheme() async {
    final index = await loadLoginThemeIndex();
    if (mounted) setState(() => _themeIndex = index);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _openThemePicker() {
    showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => _ThemePickerSheet(
        currentIndex: _themeIndex,
        onSelect: (index) async {
          await saveLoginThemeIndex(index);
          if (context.mounted) {
            Navigator.pop(context);
            setState(() => _themeIndex = index);
          }
        },
      ),
    );
  }

  void _submit() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    if (email.isEmpty || password.isEmpty) return;

    final event = _isSignUp
        ? AuthEvent.signUpRequested(email: email, password: password)
        : AuthEvent.signInRequested(email: email, password: password);

    context.read<AuthBloc>().add(event);
  }

  @override
  Widget build(BuildContext context) {
    final preset = LoginThemes.all[_themeIndex];
    final isLight = _themeIndex == 1;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(gradient: preset.gradient),
        child: SafeArea(
          child: Stack(
                  children: [
                    Positioned.fill(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return SizedBox(
                            height: constraints.maxHeight,
                            child: _LoginScrollContent(
                              isSignUp: _isSignUp,
                              isLight: isLight,
                              emailController: _emailController,
                              passwordController: _passwordController,
                              onSubmit: _submit,
                              onToggleMode: () => setState(() => _isSignUp = !_isSignUp),
                            ),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Material(
                        color: Colors.transparent,
                        child: IconButton(
                          icon: Icon(
                            Icons.palette_outlined,
                            color: isLight ? Colors.black87 : Colors.white,
                          ),
                          onPressed: _openThemePicker,
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

/// Scrollable content for the login form. Prevents overflow on small screens
/// and when the keyboard is visible by using [SingleChildScrollView] and
/// a [ConstrainedBox] with min height derived from viewport.
class _LoginScrollContent extends StatelessWidget {
  const _LoginScrollContent({
    required this.isSignUp,
    required this.isLight,
    required this.emailController,
    required this.passwordController,
    required this.onSubmit,
    required this.onToggleMode,
  });

  final bool isSignUp;
  final bool isLight;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onSubmit;
  final VoidCallback onToggleMode;

  double _minContentHeight(BuildContext context) {
    final media = MediaQuery.of(context);
    final height = media.size.height
        - media.padding.top
        - media.padding.bottom
        - media.viewInsets.bottom
        - _kBottomExtraPadding;
    return height.clamp(200.0, double.infinity);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: _kHorizontalPadding,
        vertical: _kVerticalPadding,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: _minContentHeight(context)),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            final isLoading = state is AuthLoading;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _LoginHeader(isSignUp: isSignUp, isLight: isLight),
                const SizedBox(height: _kSpacingHeader),
                _LoginFormSection(
                  emailController: emailController,
                  passwordController: passwordController,
                  isLoading: isLoading,
                  isLight: isLight,
                ),
                const SizedBox(height: _kSpacingLarge),
                _LoginPrimaryButton(
                  isSignUp: isSignUp,
                  isLoading: isLoading,
                  isLight: isLight,
                  onPressed: onSubmit,
                ),
                if (!isSignUp) ...[
                  const SizedBox(height: _kSpacingMedium),
                  _LoginSocialSection(
                    isLoading: isLoading,
                    isLight: isLight,
                  ),
                ],
                const SizedBox(height: _kSpacingXLarge),
                _LoginFooter(
                  isSignUp: isSignUp,
                  isLoading: isLoading,
                  isLight: isLight,
                  onToggle: onToggleMode,
                ),
                const SizedBox(height: _kSpacingXLarge),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _LoginHeader extends StatelessWidget {
  const _LoginHeader({required this.isSignUp, required this.isLight});

  final bool isSignUp;
  final bool isLight;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final fgColor = isLight ? Colors.black : Colors.white;
    final fgMuted = isLight ? Colors.grey.shade600 : Colors.white70;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          isSignUp ? loc.loginSignUpTitle : loc.loginSignInTitle,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                letterSpacing: -0.5,
                color: fgColor,
              ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: _kSpacingSmall),
        Text(
          isSignUp
              ? 'Введите данные для регистрации'
              : 'Войдите для продолжения',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: fgMuted,
                fontSize: 15,
              ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _LoginFormSection extends StatelessWidget {
  const _LoginFormSection({
    required this.emailController,
    required this.passwordController,
    required this.isLoading,
    required this.isLight,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isLoading;
  final bool isLight;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _LoginTextField(
          controller: emailController,
          hint: loc.email,
          icon: Icons.mail_outline,
          keyboardType: TextInputType.emailAddress,
          enabled: !isLoading,
          isLight: isLight,
        ),
        const SizedBox(height: _kSpacingMedium),
        _LoginTextField(
          controller: passwordController,
          hint: loc.password,
          icon: Icons.lock_outline,
          obscureText: true,
          enabled: !isLoading,
          isLight: isLight,
        ),
      ],
    );
  }
}

class _LoginTextField extends StatelessWidget {
  const _LoginTextField({
    required this.controller,
    required this.hint,
    required this.icon,
    this.obscureText = false,
    this.enabled = true,
    this.isLight = true,
    this.keyboardType,
  });

  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final bool obscureText;
  final bool enabled;
  final bool isLight;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    final fg = isLight ? Colors.black : Colors.white;
    final hintColor = isLight ? Colors.grey.shade500 : Colors.white54;
    final iconColor = isLight ? Colors.grey.shade600 : Colors.white70;
    final fill = isLight
        ? Colors.grey.shade100
        : Colors.white.withOpacity(0.15);

    return TextField(
      controller: controller,
      obscureText: obscureText,
      enabled: enabled,
      keyboardType: keyboardType,
      style: TextStyle(fontSize: 16, color: fg),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: hintColor, fontSize: 16),
        prefixIcon: Icon(icon, color: iconColor),
        filled: true,
        fillColor: fill,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class _LoginPrimaryButton extends StatelessWidget {
  const _LoginPrimaryButton({
    required this.isSignUp,
    required this.isLoading,
    required this.isLight,
    required this.onPressed,
  });

  final bool isSignUp;
  final bool isLoading;
  final bool isLight;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: _kButtonMinHeight),
      child: FilledButton(
        onPressed: isLoading ? null : onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: isLight ? Colors.black : Colors.white,
          foregroundColor: isLight ? Colors.white : Colors.black87,
          minimumSize: const Size.fromHeight(_kButtonMinHeight),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: isLoading
            ? SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: isLight ? Colors.white : Colors.black87,
                ),
              )
            : Text(
                isSignUp ? loc.signUpButton : loc.signInButton,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }
}

class _LoginSocialSection extends StatelessWidget {
  const _LoginSocialSection({
    required this.isLoading,
    required this.isLight,
  });

  final bool isLoading;
  final bool isLight;

  @override
  Widget build(BuildContext context) {
    final fgColor = isLight ? Colors.black : Colors.white;
    final fgMuted = isLight ? Colors.grey.shade600 : Colors.white70;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(child: Divider(color: fgMuted)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: _kSpacingMedium),
              child: Text(
                'или',
                style: TextStyle(color: fgMuted, fontSize: 13),
              ),
            ),
            Expanded(child: Divider(color: fgMuted)),
          ],
        ),
        const SizedBox(height: _kSpacingMedium),
        ConstrainedBox(
          constraints: const BoxConstraints(minHeight: _kButtonMinHeight),
          child: SignInWithAppleButton(
            style: isLight
                ? SignInWithAppleButtonStyle.black
                : SignInWithAppleButtonStyle.white,
            text: 'Продолжить с Apple',
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            onPressed: isLoading
                ? () {}
                : () => context.read<AuthBloc>().add(
                      const AuthEvent.signInWithAppleRequested(),
                    ),
          ),
        ),
        const SizedBox(height: _kSpacingMedium),
        ConstrainedBox(
          constraints: const BoxConstraints(minHeight: _kButtonMinHeight),
          child: OutlinedButton.icon(
            onPressed: isLoading
                ? null
                : () => context.read<AuthBloc>().add(
                      const AuthEvent.signInWithGoogleRequested(),
                    ),
            icon: const GoogleIcon(size: 22),
            label: Text(
              'Продолжить с Google',
              style: TextStyle(
                fontSize: 16,
                color: fgColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            style: OutlinedButton.styleFrom(
              minimumSize: const Size.fromHeight(_kButtonMinHeight),
              side: BorderSide(color: fgMuted),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _LoginFooter extends StatelessWidget {
  const _LoginFooter({
    required this.isSignUp,
    required this.isLoading,
    required this.isLight,
    required this.onToggle,
  });

  final bool isSignUp;
  final bool isLoading;
  final bool isLight;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final fgColor = isLight ? Colors.black : Colors.white;
    final fgMuted = isLight ? Colors.grey.shade600 : Colors.white70;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text(
            isSignUp ? 'Уже есть аккаунт?' : 'Впервые у нас?',
            style: TextStyle(color: fgMuted, fontSize: 14),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        TextButton(
          onPressed: isLoading ? null : onToggle,
          style: TextButton.styleFrom(
            foregroundColor: fgColor,
          ),
          child: Text(
            isSignUp ? loc.signInButton : loc.signUpButton,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}

class _ThemePickerSheet extends StatelessWidget {
  const _ThemePickerSheet({
    required this.currentIndex,
    required this.onSelect,
  });

  final int currentIndex;
  final void Function(int index) onSelect;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final maxSheetHeight = screenHeight * 0.6;

    return SafeArea(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: maxSheetHeight),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Выбор темы фона',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: _kSpacingMedium),
                ...List.generate(LoginThemes.all.length, (index) {
                  final preset = LoginThemes.all[index];
                  final isSelected = index == currentIndex;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => onSelect(index),
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: isSelected
                                  ? Theme.of(context).colorScheme.primary
                                  : Colors.grey.shade300,
                              width: isSelected ? 2 : 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  width: 56,
                                  height: 56,
                                  decoration: BoxDecoration(
                                    gradient: preset.gradient,
                                  ),
                                ),
                              ),
                              const SizedBox(width: _kSpacingMedium),
                              Text(
                                preset.name,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:money_tracker/core/di/injection.dart';
import 'package:money_tracker/core/localization/app_localizations.dart';
import 'package:money_tracker/core/localization/locale_cubit.dart';
import 'package:money_tracker/core/theme/theme_cubit.dart';
import 'package:money_tracker/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:money_tracker/features/auth/presentation/bloc/auth_event.dart';
import 'package:money_tracker/features/auth/presentation/bloc/auth_state.dart';
import 'package:money_tracker/features/auth/presentation/screen/login_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide AuthState;

import 'package:money_tracker/core/theme/app_theme.dart';
import 'package:money_tracker/features/transactions/data/transactions_storage.dart';
import 'package:money_tracker/features/welcome/presentation/welcome_screen.dart';
import 'package:money_tracker/main_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await TransactionsStorage.load();

  // Load environment variables from .env asset.
  await dotenv.load(fileName: '.env');

  // Initialize Supabase with credentials from .env — never hardcoded.
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );

  // Wire up the dependency injection graph.
  await configureDependencies();

  runApp(const MoneyTrackerApp());
}

class MoneyTrackerApp extends StatelessWidget {
  const MoneyTrackerApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              getIt<AuthBloc>()..add(const AuthEvent.authStateChanged()),
        ),
        BlocProvider(
          create: (_) => ThemeCubit(),
        ),
        BlocProvider(
          create: (_) => LocaleCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return BlocBuilder<LocaleCubit, Locale>(
            builder: (context, locale) {
              return MaterialApp(
                title: 'Money Tracker',
                debugShowCheckedModeBanner: false,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: themeMode,
                locale: locale,
                supportedLocales: AppLocalizations.supportedLocales,
                localizationsDelegates: const [
                  AppLocalizationsDelegate(),
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                home: const AppNavigator(),
              );
            },
          );
        },
      ),
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
        onGetStarted: () => setState(() => _showWelcome = false),
      );
    }

    // React to auth state from BLoC instead of directly calling AuthService.
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        // Side-effects only: navigation, snackbars, dialogs.
        if (state is AuthFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.failure.message),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) => switch (state) {
        AuthAuthenticated() => const MainScreen(),
        _ => const LoginScreen(),
      },
    );
  }
}

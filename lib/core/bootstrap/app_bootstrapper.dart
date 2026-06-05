import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:money_tracker/core/bootstrap/app_bootstrap_result.dart';
import 'package:money_tracker/core/di/injection.dart';
import 'package:money_tracker/core/error/failure.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppBootstrapper {
  const AppBootstrapper();

  static const _requiredEnvKeys = ['SUPABASE_URL', 'SUPABASE_ANON_KEY'];

  Future<AppBootstrapResult> initialize() async {
    try {
      await initializeDateFormatting('ru');
      await dotenv.load(fileName: '.env');

      final missingKeys = _requiredEnvKeys
          .where((key) => (dotenv.maybeGet(key) ?? '').trim().isEmpty)
          .toList();

      if (missingKeys.isNotEmpty) {
        return AppBootstrapFailure(
          ConfigurationFailure(
            'Missing required environment keys: ${missingKeys.join(', ')}. '
            'Add them to .env to enable authentication and backend features.',
          ),
        );
      }

      await Supabase.initialize(
        url: dotenv.maybeGet('SUPABASE_URL')!,
        anonKey: dotenv.maybeGet('SUPABASE_ANON_KEY')!,
      );

      await configureDependencies();

      return const AppBootstrapSuccess();
    } catch (error) {
      return AppBootstrapFailure(
        ConfigurationFailure('Application startup failed: $error'),
      );
    }
  }
}

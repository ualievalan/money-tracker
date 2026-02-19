import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Provides the [SupabaseClient] as a lazy singleton via the DI container.
///
/// Injectable reads this class and registers the [SupabaseClient] for injection
/// anywhere in the app. The actual Supabase initialization must happen in
/// [main] before this getter is called.
@lazySingleton
class SupabaseClientProvider {
  SupabaseClientProvider();

  /// The shared Supabase client — safe to call after [Supabase.initialize].
  SupabaseClient get client => Supabase.instance.client;
}

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:money_tracker/core/di/injection.config.dart';

/// Global service locator instance.
final GetIt getIt = GetIt.instance;

/// Call this once in [main] before [runApp].
///
/// Registers all dependencies annotated with `@injectable`, `@lazySingleton`, etc.
@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() async => getIt.init();


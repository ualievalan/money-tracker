// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/auth/data/repositories/supabase_auth_repository.dart'
    as _i5;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i4;
import '../../features/auth/domain/usecases/sign_in_use_case.dart' as _i6;
import '../../features/auth/domain/usecases/sign_in_with_apple_use_case.dart'
    as _i7;
import '../../features/auth/domain/usecases/sign_in_with_google_use_case.dart'
    as _i8;
import '../../features/auth/domain/usecases/sign_out_use_case.dart' as _i9;
import '../../features/auth/domain/usecases/sign_up_use_case.dart' as _i10;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i11;
import '../network/supabase_client_provider.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.SupabaseClientProvider>(
        () => _i3.SupabaseClientProvider());
    gh.lazySingleton<_i4.AuthRepository>(
        () => _i5.SupabaseAuthRepository(gh<_i3.SupabaseClientProvider>()));
    gh.lazySingleton<_i6.SignInUseCase>(
        () => _i6.SignInUseCase(gh<_i4.AuthRepository>()));
    gh.lazySingleton<_i7.SignInWithAppleUseCase>(
        () => _i7.SignInWithAppleUseCase(gh<_i4.AuthRepository>()));
    gh.lazySingleton<_i8.SignInWithGoogleUseCase>(
        () => _i8.SignInWithGoogleUseCase(gh<_i4.AuthRepository>()));
    gh.lazySingleton<_i9.SignOutUseCase>(
        () => _i9.SignOutUseCase(gh<_i4.AuthRepository>()));
    gh.lazySingleton<_i10.SignUpUseCase>(
        () => _i10.SignUpUseCase(gh<_i4.AuthRepository>()));
    gh.factory<_i11.AuthBloc>(() => _i11.AuthBloc(
          gh<_i6.SignInUseCase>(),
          gh<_i10.SignUpUseCase>(),
          gh<_i9.SignOutUseCase>(),
          gh<_i7.SignInWithAppleUseCase>(),
          gh<_i8.SignInWithGoogleUseCase>(),
          gh<_i4.AuthRepository>(),
        ));
    return this;
  }
}

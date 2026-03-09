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
    as _i9;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i8;
import '../../features/auth/domain/usecases/sign_in_use_case.dart' as _i12;
import '../../features/auth/domain/usecases/sign_in_with_apple_use_case.dart'
    as _i13;
import '../../features/auth/domain/usecases/sign_out_use_case.dart' as _i14;
import '../../features/auth/domain/usecases/sign_up_use_case.dart' as _i15;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i17;
import '../../features/transactions/data/repositories/shared_prefs_transactions_repository.dart'
    as _i5;
import '../../features/transactions/domain/repositories/transactions_repository.dart'
    as _i4;
import '../../features/transactions/domain/usecases/add_transaction_use_case.dart'
    as _i7;
<<<<<<< HEAD
import '../../features/transactions/domain/usecases/delete_transaction_use_case.dart'
    as _i10;
import '../../features/transactions/domain/usecases/get_transactions_use_case.dart'
    as _i11;
import '../../features/transactions/domain/usecases/update_transaction_use_case.dart'
    as _i6;
import '../../features/transactions/presentation/bloc/transactions_bloc.dart'
    as _i16;
=======
import '../../features/auth/domain/usecases/sign_in_with_google_use_case.dart'
    as _i8;
import '../../features/auth/domain/usecases/sign_out_use_case.dart' as _i9;
import '../../features/auth/domain/usecases/sign_up_use_case.dart' as _i10;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i11;
>>>>>>> 539eae05e93de6c6670fe810fc9699baecd68295
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
<<<<<<< HEAD
    gh.lazySingleton<_i4.TransactionsRepository>(
        () => _i5.TransactionsLocalRepository());
    gh.lazySingleton<_i6.UpdateTransactionUseCase>(
        () => _i6.UpdateTransactionUseCase(gh<_i4.TransactionsRepository>()));
    gh.lazySingleton<_i7.AddTransactionUseCase>(
        () => _i7.AddTransactionUseCase(gh<_i4.TransactionsRepository>()));
    gh.lazySingleton<_i8.AuthRepository>(
        () => _i9.SupabaseAuthRepository(gh<_i3.SupabaseClientProvider>()));
    gh.lazySingleton<_i10.DeleteTransactionUseCase>(
        () => _i10.DeleteTransactionUseCase(gh<_i4.TransactionsRepository>()));
    gh.lazySingleton<_i11.GetTransactionsUseCase>(
        () => _i11.GetTransactionsUseCase(gh<_i4.TransactionsRepository>()));
    gh.lazySingleton<_i12.SignInUseCase>(
        () => _i12.SignInUseCase(gh<_i8.AuthRepository>()));
    gh.lazySingleton<_i13.SignInWithAppleUseCase>(
        () => _i13.SignInWithAppleUseCase(gh<_i8.AuthRepository>()));
    gh.lazySingleton<_i14.SignOutUseCase>(
        () => _i14.SignOutUseCase(gh<_i8.AuthRepository>()));
    gh.lazySingleton<_i15.SignUpUseCase>(
        () => _i15.SignUpUseCase(gh<_i8.AuthRepository>()));
    gh.factory<_i16.TransactionsBloc>(() => _i16.TransactionsBloc(
          gh<_i11.GetTransactionsUseCase>(),
          gh<_i7.AddTransactionUseCase>(),
          gh<_i6.UpdateTransactionUseCase>(),
          gh<_i10.DeleteTransactionUseCase>(),
        ));
    gh.factory<_i17.AuthBloc>(() => _i17.AuthBloc(
          gh<_i12.SignInUseCase>(),
          gh<_i15.SignUpUseCase>(),
          gh<_i14.SignOutUseCase>(),
          gh<_i13.SignInWithAppleUseCase>(),
          gh<_i8.AuthRepository>(),
=======
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
>>>>>>> 539eae05e93de6c6670fe810fc9699baecd68295
        ));
    return this;
  }
}

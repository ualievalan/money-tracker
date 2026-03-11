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
<<<<<<< HEAD
    as _i11;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i10;
import '../../features/auth/domain/usecases/sign_in_use_case.dart' as _i14;
import '../../features/auth/domain/usecases/sign_in_with_apple_use_case.dart'
    as _i15;
import '../../features/auth/domain/usecases/sign_in_with_google_use_case.dart'
    as _i16;
import '../../features/auth/domain/usecases/sign_out_use_case.dart' as _i17;
import '../../features/auth/domain/usecases/sign_up_use_case.dart' as _i18;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i21;
import '../../features/tasks/data/repositories/local_tasks_repository.dart'
    as _i5;
import '../../features/tasks/domain/repositories/tasks_repository.dart' as _i4;
import '../../features/tasks/presentation/bloc/tasks_bloc.dart' as _i19;
import '../../features/transactions/data/repositories/shared_prefs_transactions_repository.dart'
    as _i7;
import '../../features/transactions/domain/repositories/transactions_repository.dart'
    as _i6;
import '../../features/transactions/domain/usecases/add_transaction_use_case.dart'
    as _i9;
import '../../features/transactions/domain/usecases/delete_transaction_use_case.dart'
    as _i12;
import '../../features/transactions/domain/usecases/get_transactions_use_case.dart'
    as _i13;
import '../../features/transactions/domain/usecases/update_transaction_use_case.dart'
    as _i8;
import '../../features/transactions/presentation/bloc/transactions_bloc.dart'
    as _i20;
=======
    as _i9;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i8;
import '../../features/auth/domain/usecases/sign_in_use_case.dart' as _i12;
import '../../features/auth/domain/usecases/sign_in_with_apple_use_case.dart'
    as _i13;
import '../../features/auth/domain/usecases/sign_in_with_google_use_case.dart'
    as _i14;
import '../../features/auth/domain/usecases/sign_out_use_case.dart' as _i15;
import '../../features/auth/domain/usecases/sign_up_use_case.dart' as _i16;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i18;
import '../../features/transactions/data/repositories/shared_prefs_transactions_repository.dart'
    as _i5;
import '../../features/transactions/domain/repositories/transactions_repository.dart'
    as _i4;
import '../../features/transactions/domain/usecases/add_transaction_use_case.dart'
    as _i7;
import '../../features/transactions/domain/usecases/delete_transaction_use_case.dart'
    as _i10;
import '../../features/transactions/domain/usecases/get_transactions_use_case.dart'
    as _i11;
import '../../features/transactions/domain/usecases/update_transaction_use_case.dart'
    as _i6;
import '../../features/transactions/presentation/bloc/transactions_bloc.dart'
    as _i17;
>>>>>>> origin/main
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
    gh.lazySingleton<_i4.TasksRepository>(() => _i5.LocalTasksRepository());
    gh.lazySingleton<_i6.TransactionsRepository>(
        () => _i7.TransactionsLocalRepository());
    gh.lazySingleton<_i8.UpdateTransactionUseCase>(
        () => _i8.UpdateTransactionUseCase(gh<_i6.TransactionsRepository>()));
    gh.lazySingleton<_i9.AddTransactionUseCase>(
        () => _i9.AddTransactionUseCase(gh<_i6.TransactionsRepository>()));
    gh.lazySingleton<_i10.AuthRepository>(
        () => _i11.SupabaseAuthRepository(gh<_i3.SupabaseClientProvider>()));
    gh.lazySingleton<_i12.DeleteTransactionUseCase>(
        () => _i12.DeleteTransactionUseCase(gh<_i6.TransactionsRepository>()));
    gh.lazySingleton<_i13.GetTransactionsUseCase>(
        () => _i13.GetTransactionsUseCase(gh<_i6.TransactionsRepository>()));
    gh.lazySingleton<_i14.SignInUseCase>(
        () => _i14.SignInUseCase(gh<_i10.AuthRepository>()));
    gh.lazySingleton<_i15.SignInWithAppleUseCase>(
        () => _i15.SignInWithAppleUseCase(gh<_i10.AuthRepository>()));
    gh.lazySingleton<_i16.SignInWithGoogleUseCase>(
        () => _i16.SignInWithGoogleUseCase(gh<_i10.AuthRepository>()));
    gh.lazySingleton<_i17.SignOutUseCase>(
        () => _i17.SignOutUseCase(gh<_i10.AuthRepository>()));
    gh.lazySingleton<_i18.SignUpUseCase>(
        () => _i18.SignUpUseCase(gh<_i10.AuthRepository>()));
    gh.factory<_i19.TasksBloc>(() => _i19.TasksBloc(gh<_i4.TasksRepository>()));
    gh.factory<_i20.TransactionsBloc>(() => _i20.TransactionsBloc(
          gh<_i13.GetTransactionsUseCase>(),
          gh<_i9.AddTransactionUseCase>(),
          gh<_i8.UpdateTransactionUseCase>(),
          gh<_i12.DeleteTransactionUseCase>(),
        ));
    gh.factory<_i21.AuthBloc>(() => _i21.AuthBloc(
          gh<_i14.SignInUseCase>(),
          gh<_i18.SignUpUseCase>(),
          gh<_i17.SignOutUseCase>(),
          gh<_i15.SignInWithAppleUseCase>(),
          gh<_i16.SignInWithGoogleUseCase>(),
          gh<_i10.AuthRepository>(),
=======
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
    gh.lazySingleton<_i14.SignInWithGoogleUseCase>(
        () => _i14.SignInWithGoogleUseCase(gh<_i8.AuthRepository>()));
    gh.lazySingleton<_i15.SignOutUseCase>(
        () => _i15.SignOutUseCase(gh<_i8.AuthRepository>()));
    gh.lazySingleton<_i16.SignUpUseCase>(
        () => _i16.SignUpUseCase(gh<_i8.AuthRepository>()));
    gh.factory<_i17.TransactionsBloc>(() => _i17.TransactionsBloc(
          gh<_i11.GetTransactionsUseCase>(),
          gh<_i7.AddTransactionUseCase>(),
          gh<_i6.UpdateTransactionUseCase>(),
          gh<_i10.DeleteTransactionUseCase>(),
        ));
    gh.factory<_i18.AuthBloc>(() => _i18.AuthBloc(
          gh<_i12.SignInUseCase>(),
          gh<_i16.SignUpUseCase>(),
          gh<_i15.SignOutUseCase>(),
          gh<_i13.SignInWithAppleUseCase>(),
          gh<_i14.SignInWithGoogleUseCase>(),
          gh<_i8.AuthRepository>(),
>>>>>>> origin/main
        ));
    return this;
  }
}

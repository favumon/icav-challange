// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:domain/features/login/repositories/authetication_repository.dart'
    as _i11;
import 'package:domain/features/signup/repositories/user_signup_repository.dart'
    as _i8;
import 'package:domain/features/user_profile/repositories/user_profile_repository.dart'
    as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive/hive.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

import '../features/login/datasource/authetication_local_data_soure.dart'
    as _i10;
import '../features/login/repositories/authetication_repository_impl.dart'
    as _i12;
import '../features/signup/datasource/user_signup_local_data_soure.dart' as _i7;
import '../features/signup/repositories/user_signup_repository_impl.dart'
    as _i9;
import '../features/user_profile/datasource/user_profile_local_data_soure.dart'
    as _i4;
import '../features/user_profile/repositories/user_profile_repository_impl.dart'
    as _i6;
import 'register_module.dart' as _i13; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initDataGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  await gh.factoryAsync<_i3.HiveInterface>(() => registerModule.hive,
      preResolve: true);
  gh.lazySingleton<_i4.UserProfileLocalDataSource>(
      () => _i4.UserProfileLocalDataSource(get<_i3.HiveInterface>()),
      dispose: (i) => i.dispose());
  gh.lazySingleton<_i5.UserProfileRepository>(() =>
      _i6.UserProfileRepositoryImpl(get<_i4.UserProfileLocalDataSource>()));
  gh.lazySingleton<_i7.UserSignupLocalDataSource>(
      () => _i7.UserSignupLocalDataSource(get<_i3.HiveInterface>()),
      dispose: (i) => i.dispose());
  gh.lazySingleton<_i8.UserSignupRepository>(
      () => _i9.UserSignupRepositoryImpl(get<_i7.UserSignupLocalDataSource>()));
  gh.lazySingleton<_i10.AutheticationLocalDataSource>(
      () => _i10.AutheticationLocalDataSource(get<_i3.HiveInterface>()),
      dispose: (i) => i.dispose());
  gh.lazySingleton<_i11.AuthenticationRepository>(() =>
      _i12.AuthenticationRepositoryImpl(
          get<_i10.AutheticationLocalDataSource>()));
  return get;
}

class _$RegisterModule extends _i13.RegisterModule {}

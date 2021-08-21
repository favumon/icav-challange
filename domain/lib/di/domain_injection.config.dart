// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../features/login/repositories/authetication_repository.dart' as _i4;
import '../features/login/usecases/autheticate_user.dart' as _i3;
import '../features/signup/repositories/user_signup_repository.dart' as _i9;
import '../features/signup/usecases/submit_signup_info.dart' as _i8;
import '../features/user_profile/repositories/user_profile_repository.dart'
    as _i6;
import '../features/user_profile/usecases/get_user_info.dart' as _i5;
import '../features/user_profile/usecases/logout_user.dart' as _i7;
import '../features/user_profile/usecases/update_user_info.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initDomainGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.AuthenticateUser>(
      () => _i3.AuthenticateUser(get<_i4.AuthenticationRepository>()));
  gh.lazySingleton<_i5.GetUserInfo>(
      () => _i5.GetUserInfo(get<_i6.UserProfileRepository>()));
  gh.lazySingleton<_i7.LogoutUser>(
      () => _i7.LogoutUser(get<_i6.UserProfileRepository>()));
  gh.lazySingleton<_i8.SubmitSignupInfo>(
      () => _i8.SubmitSignupInfo(get<_i9.UserSignupRepository>()));
  gh.lazySingleton<_i10.UpdateUserInfo>(
      () => _i10.UpdateUserInfo(get<_i6.UserProfileRepository>()));
  return get;
}

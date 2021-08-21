// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:domain/features/login/usecases/autheticate_user.dart' as _i15;
import 'package:domain/features/signup/usecases/submit_signup_info.dart' as _i8;
import 'package:domain/features/user_profile/usecases/get_user_info.dart'
    as _i10;
import 'package:domain/features/user_profile/usecases/logout_user.dart' as _i12;
import 'package:domain/features/user_profile/usecases/update_user_info.dart'
    as _i13;
import 'package:get/get.dart' as _i4;
import 'package:get/instance_manager.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/services/alert_service.dart' as _i3;
import '../core/services/navigation_service.dart' as _i6;
import '../features/login/controllers/login_page_controller.dart' as _i14;
import '../features/signup/controllers/signup_page_controller.dart' as _i7;
import '../features/splash_screen/controllers/splash_screen_controller.dart'
    as _i9;
import '../features/user_profile/controllers/user_profile_page_controller.dart'
    as _i11;
import 'register_module.dart' as _i16; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.AlertService>(
      () => _i3.AlertService(get<_i4.GetInterface>()));
  gh.lazySingleton<_i5.GetInterface>(() => registerModule.gets());
  gh.lazySingleton<_i1.GetIt>(() => registerModule.getit());
  gh.lazySingleton<_i6.NavigationService>(
      () => _i6.NavigationService(get<_i4.GetInterface>()));
  gh.factory<_i7.SignupPageController>(() => _i7.SignupPageController(
      get<_i6.NavigationService>(),
      get<_i3.AlertService>(),
      get<_i8.SubmitSignupInfo>()));
  gh.factory<_i9.SplashScreenController>(() => _i9.SplashScreenController(
      get<_i6.NavigationService>(), get<_i10.GetUserInfo>()));
  gh.factory<_i11.UserProfilePageController>(() =>
      _i11.UserProfilePageController(
          get<_i10.GetUserInfo>(),
          get<_i12.LogoutUser>(),
          get<_i6.NavigationService>(),
          get<_i13.UpdateUserInfo>(),
          get<_i3.AlertService>()));
  gh.factory<_i14.LoginPageController>(() => _i14.LoginPageController(
      get<_i6.NavigationService>(),
      get<_i3.AlertService>(),
      get<_i15.AuthenticateUser>()));
  return get;
}

class _$RegisterModule extends _i16.RegisterModule {}

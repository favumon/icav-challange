import 'package:dartz/dartz.dart';
import 'package:domain/core/entities/user.dart';
import 'package:domain/core/error/failures.dart';
import 'package:domain/core/usecases/usecase.dart';
import 'package:domain/features/user_profile/usecases/get_user_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:icav_challenge/app_config/routes/app_routes.dart';
import 'package:icav_challenge/core/services/navigation_service.dart';
import 'package:icav_challenge/features/splash_screen/controllers/splash_screen_controller.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'splash_screen_controller_test.mocks.dart';

@GenerateMocks([NavigationService, GetUserInfo])
main() {
  late MockNavigationService mockNavigationService;
  late SplashScreenController splashScreenController;
  late MockGetUserInfo mockGetUserInfo;
  setUp(() {
    mockNavigationService = MockNavigationService();
    mockGetUserInfo = MockGetUserInfo();

    splashScreenController =
        SplashScreenController(mockNavigationService, mockGetUserInfo);
  });

  test('Should redirect to login page when user session not available',
      () async {
    when(mockGetUserInfo(NoParams())).thenAnswer(
        (realInvocation) => Future.value(Left(UserProfileFailure())));

    splashScreenController.navigate();
    await untilCalled(
        mockNavigationService.navigateAndReplace(AppRouts.loginPage));

    verify(mockGetUserInfo(NoParams()));

    verify(mockNavigationService.navigateAndReplace(AppRouts.loginPage));
  });
  test('Should redirect to profile page when user session  available',
      () async {
    when(mockGetUserInfo(NoParams())).thenAnswer((realInvocation) =>
        Future.value(Right(User(
            name: 'name',
            email: 'email',
            phone: 'phone',
            username: 'username',
            password: 'password'))));

    splashScreenController.navigate();
    await untilCalled(
        mockNavigationService.navigateAndReplace(AppRouts.profilePage));

    verify(mockGetUserInfo(NoParams()));

    verify(mockNavigationService.navigateAndReplace(AppRouts.profilePage));
  });
}

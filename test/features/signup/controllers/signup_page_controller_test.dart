import 'package:dartz/dartz.dart';
import 'package:domain/core/entities/user.dart';
import 'package:domain/features/signup/entities/signup_response.dart';
import 'package:domain/features/signup/usecases/submit_signup_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:icav_challenge/app_config/routes/app_routes.dart';
import 'package:icav_challenge/core/services/alert_service.dart';
import 'package:icav_challenge/core/services/navigation_service.dart';
import 'package:icav_challenge/features/signup/controllers/signup_page_controller.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'signup_page_controller_test.mocks.dart';

@GenerateMocks([NavigationService, AlertService, SubmitSignupInfo])
main() {
  late MockNavigationService mockNavigationService;
  late MockAlertService mockAlertService;
  late MockSubmitSignupInfo mockSubmitSignupInfo;
  late SignupPageController signupPageController;
  setUp(() {
    mockAlertService = MockAlertService();
    mockNavigationService = MockNavigationService();
    mockSubmitSignupInfo = MockSubmitSignupInfo();
    signupPageController = SignupPageController(
        mockNavigationService, mockAlertService, mockSubmitSignupInfo);
  });

  test('Should redirect to login page when user registration was successfull',
      () async {
    final user = User(
        name: 'name',
        email: 'email',
        phone: 'phone',
        username: 'username',
        password: 'password');

    final params = SignupRequestParams(user);

    when(mockSubmitSignupInfo(params))
        .thenAnswer((realInvocation) => Future.value(Right(SignupResponse())));
    signupPageController.registerUser(
        true, 'name', 'email', 'phone', 'username', 'password');

    await untilCalled(
        mockNavigationService.navigateAndReplace(AppRouts.loginPage));
    verify(mockSubmitSignupInfo(params));
    verify(mockNavigationService.navigateAndReplace(AppRouts.loginPage));
  });
  test('Should show alert snackbar if user registration fails', () async {
    final user = User(
        name: 'name',
        email: 'email',
        phone: 'phone',
        username: 'username',
        password: 'password');

    final params = SignupRequestParams(user);

    when(mockSubmitSignupInfo(params))
        .thenAnswer((realInvocation) => Future.value(Right(SignupResponse())));
    signupPageController.registerUser(
        true, 'name', 'email', 'phone', 'username', 'password');

    await untilCalled(
        mockNavigationService.navigateAndReplace(AppRouts.loginPage));
    verify(mockSubmitSignupInfo(params));
    verify(mockNavigationService.navigateAndReplace(AppRouts.loginPage));
  });
}

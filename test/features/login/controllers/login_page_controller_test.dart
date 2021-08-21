import 'package:dartz/dartz.dart';
import 'package:domain/core/entities/user.dart';
import 'package:domain/core/error/failures.dart';
import 'package:domain/features/login/usecases/autheticate_user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:icav_challenge/app_config/routes/app_routes.dart';
import 'package:icav_challenge/core/services/alert_service.dart';
import 'package:icav_challenge/core/services/navigation_service.dart';
import 'package:icav_challenge/features/login/controllers/login_page_controller.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_page_controller_test.mocks.dart';

@GenerateMocks([NavigationService, AlertService, AuthenticateUser])
main() {
  late LoginPageController loginPageController;

  late MockNavigationService mockNavigationService;
  late MockAlertService mockAlertService;
  late MockAuthenticateUser mockAuthenticateUser;

  setUp(() {
    mockAuthenticateUser = MockAuthenticateUser();
    mockAlertService = MockAlertService();
    mockNavigationService = MockNavigationService();
    loginPageController = LoginPageController(
        mockNavigationService, mockAlertService, mockAuthenticateUser);
  });
  test(
      'Should redirect to profile page by replacing login page when authetication was successfull',
      () async {
    final username = 'username';
    final password = 'password';
    final user = User(
        name: 'name',
        email: 'email',
        phone: 'phone',
        username: 'usename',
        password: 'password');
    final param = AutheticationRequestParams(username, password);
    when(mockAuthenticateUser(param))
        .thenAnswer((realInvocation) => Future.value(Right(user)));
    loginPageController.autheticate(username, password);

    await untilCalled(
        mockNavigationService.navigateAndReplace(AppRouts.profilePage));

    verify(mockAuthenticateUser(param));
    verify(mockNavigationService.navigateAndReplace(AppRouts.profilePage));
  });
  test('Should show snackbar alert if authetication was unsuccessfull',
      () async {
    final username = 'username';
    final password = 'password';

    final param = AutheticationRequestParams(username, password);
    when(mockAuthenticateUser(param))
        .thenAnswer((realInvocation) => Future.value(Left(LoginFailure())));
    loginPageController.autheticate(username, password);

    await untilCalled(mockAlertService.showAlertSnackbar(
        title: anyNamed('title'), message: anyNamed('message')));

    verify(mockAuthenticateUser(param));
    verify(mockAlertService.showAlertSnackbar(
        title: anyNamed('title'), message: anyNamed('message')));
  });
  test('Should navigate to Signup page when signup button tapped', () async {
    loginPageController.onSignup();

    verify(mockNavigationService.navigateAndReplace(AppRouts.signupPage));
  });
}

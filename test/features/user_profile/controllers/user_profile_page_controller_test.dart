import 'package:dartz/dartz.dart';
import 'package:domain/core/entities/user.dart';
import 'package:domain/core/error/failures.dart';
import 'package:domain/core/usecases/usecase.dart';
import 'package:domain/features/user_profile/usecases/get_user_info.dart';
import 'package:domain/features/user_profile/usecases/logout_user.dart';
import 'package:domain/features/user_profile/usecases/update_user_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:icav_challenge/app_config/routes/app_routes.dart';
import 'package:icav_challenge/core/services/alert_service.dart';
import 'package:icav_challenge/core/services/navigation_service.dart';
import 'package:icav_challenge/features/user_profile/controllers/user_profile_page_controller.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_profile_page_controller_test.mocks.dart';

@GenerateMocks(
    [NavigationService, AlertService, GetUserInfo, LogoutUser, UpdateUserInfo])
main() {
  late MockNavigationService mockNavigationService;
  late MockGetUserInfo mockGetUserInfo;
  late MockAlertService mockAlertService;
  late MockLogoutUser mockLogoutUser;
  late MockUpdateUserInfo mockUpdateUserInfo;

  late UserProfilePageController userProfilePageController;
  setUp(() {
    mockNavigationService = MockNavigationService();
    mockGetUserInfo = MockGetUserInfo();
    mockUpdateUserInfo = MockUpdateUserInfo();
    mockLogoutUser = MockLogoutUser();
    mockAlertService = MockAlertService();
    userProfilePageController = UserProfilePageController(
        mockGetUserInfo,
        mockLogoutUser,
        mockNavigationService,
        mockUpdateUserInfo,
        mockAlertService);
  });

  test('Should get user info from GetUserInfo usecase', () async {
    final user = User(
        name: 'name',
        email: 'email',
        phone: 'phone',
        username: 'username',
        password: 'password');
    when(mockGetUserInfo(NoParams()))
        .thenAnswer((realInvocation) => Future.value(Right(user)));

    userProfilePageController.fetchUserInfo();

    verify(mockGetUserInfo(NoParams()));
  });
  test('Should not update user when form has errors', () async {
    userProfilePageController.updateUser(
        false, 'name', 'email', 'phone', 'username', 'password');

    verifyZeroInteractions(mockUpdateUserInfo);
  });
  test('Should show success snackbar when user updation was success', () async {
    final user = User(
        name: 'name',
        email: 'email',
        phone: 'phone',
        username: 'username',
        password: 'password');
    final parms = UpdateUserRequestParams(user);
    when(mockUpdateUserInfo(parms))
        .thenAnswer((realInvocation) => Future.value(Right(null)));

    userProfilePageController.updateUser(
        true, 'name', 'email', 'phone', 'username', 'password');
    await untilCalled(mockAlertService.showSuccessSnackbar(
        title: anyNamed('title'), message: anyNamed('message')));

    verify(mockUpdateUserInfo(parms));
    verify(mockAlertService.showSuccessSnackbar(
        title: anyNamed('title'), message: anyNamed('message')));
  });
  test('Should show alert snackbar when user updation failed', () async {
    final user = User(
        name: 'name',
        email: 'email',
        phone: 'phone',
        username: 'username',
        password: 'password');
    final parms = UpdateUserRequestParams(user);
    when(mockUpdateUserInfo(parms)).thenAnswer(
        (realInvocation) => Future.value(Left(UserProfileFailure())));

    userProfilePageController.updateUser(
        true, 'name', 'email', 'phone', 'username', 'password');
    await untilCalled(mockAlertService.showAlertSnackbar(
        title: anyNamed('title'), message: anyNamed('message')));

    verify(mockUpdateUserInfo(parms));
    verify(mockAlertService.showAlertSnackbar(
        title: anyNamed('title'), message: anyNamed('message')));
  });
  test('Should logout and navigate to login page when logout button tapped',
      () async {
    when(mockLogoutUser(NoParams()))
        .thenAnswer((realInvocation) => Future.value(Right(null)));

    userProfilePageController.onLogoutUser();

    await untilCalled(
        mockNavigationService.navigateAndReplace(AppRouts.loginPage));

    verify(mockLogoutUser(NoParams()));
    verify(mockNavigationService.navigateAndReplace(AppRouts.loginPage));
  });
}

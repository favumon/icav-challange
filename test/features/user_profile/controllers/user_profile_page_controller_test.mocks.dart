// Mocks generated by Mockito 5.0.14 from annotations
// in icav_challenge/test/features/user_profile/controllers/user_profile_page_controller_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i6;

import 'package:dartz/dartz.dart' as _i4;
import 'package:domain/core/entities/user.dart' as _i11;
import 'package:domain/core/error/failures.dart' as _i10;
import 'package:domain/core/usecases/usecase.dart' as _i12;
import 'package:domain/features/user_profile/repositories/user_profile_repository.dart'
    as _i3;
import 'package:domain/features/user_profile/usecases/get_user_info.dart'
    as _i9;
import 'package:domain/features/user_profile/usecases/logout_user.dart' as _i13;
import 'package:domain/features/user_profile/usecases/update_user_info.dart'
    as _i14;
import 'package:flutter/material.dart' as _i7;
import 'package:get/get.dart' as _i2;
import 'package:icav_challenge/core/services/alert_service.dart' as _i8;
import 'package:icav_challenge/core/services/navigation_service.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeGetInterface_0 extends _i1.Fake implements _i2.GetInterface {}

class _FakeUserProfileRepository_1 extends _i1.Fake
    implements _i3.UserProfileRepository {}

class _FakeEither_2<L, R> extends _i1.Fake implements _i4.Either<L, R> {}

/// A class which mocks [NavigationService].
///
/// See the documentation for Mockito's code generation for more information.
class MockNavigationService extends _i1.Mock implements _i5.NavigationService {
  MockNavigationService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.GetInterface get get => (super.noSuchMethod(Invocation.getter(#get),
      returnValue: _FakeGetInterface_0()) as _i2.GetInterface);
  @override
  _i6.Future<dynamic>? navigate(String? route, {dynamic arguments}) =>
      (super.noSuchMethod(
              Invocation.method(#navigate, [route], {#arguments: arguments}))
          as _i6.Future<dynamic>?);
  @override
  void navigateAndReplace(String? route, {dynamic arguments, dynamic result}) =>
      super.noSuchMethod(
          Invocation.method(#navigateAndReplace, [route],
              {#arguments: arguments, #result: result}),
          returnValueForMissingStub: null);
  @override
  void navigateBackUntil(String? route) =>
      super.noSuchMethod(Invocation.method(#navigateBackUntil, [route]),
          returnValueForMissingStub: null);
  @override
  void navigateAndClearStackUntil(String? route,
          {bool Function(_i7.Route<dynamic>)? predicate}) =>
      super.noSuchMethod(
          Invocation.method(
              #navigateAndClearStackUntil, [route], {#predicate: predicate}),
          returnValueForMissingStub: null);
  @override
  void navigateBack() =>
      super.noSuchMethod(Invocation.method(#navigateBack, []),
          returnValueForMissingStub: null);
  @override
  String toString() => super.toString();
}

/// A class which mocks [AlertService].
///
/// See the documentation for Mockito's code generation for more information.
class MockAlertService extends _i1.Mock implements _i8.AlertService {
  MockAlertService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  void showAlertSnackbar({String? title, String? message}) =>
      super.noSuchMethod(
          Invocation.method(
              #showAlertSnackbar, [], {#title: title, #message: message}),
          returnValueForMissingStub: null);
  @override
  void showSuccessSnackbar({String? title, String? message}) =>
      super.noSuchMethod(
          Invocation.method(
              #showSuccessSnackbar, [], {#title: title, #message: message}),
          returnValueForMissingStub: null);
  @override
  String toString() => super.toString();
}

/// A class which mocks [GetUserInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetUserInfo extends _i1.Mock implements _i9.GetUserInfo {
  MockGetUserInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.UserProfileRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
              returnValue: _FakeUserProfileRepository_1())
          as _i3.UserProfileRepository);
  @override
  _i6.Future<_i4.Either<_i10.Failure, _i11.User>> call(_i12.NoParams? params) =>
      (super.noSuchMethod(Invocation.method(#call, [params]),
              returnValue: Future<_i4.Either<_i10.Failure, _i11.User>>.value(
                  _FakeEither_2<_i10.Failure, _i11.User>()))
          as _i6.Future<_i4.Either<_i10.Failure, _i11.User>>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [LogoutUser].
///
/// See the documentation for Mockito's code generation for more information.
class MockLogoutUser extends _i1.Mock implements _i13.LogoutUser {
  MockLogoutUser() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.UserProfileRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
              returnValue: _FakeUserProfileRepository_1())
          as _i3.UserProfileRepository);
  @override
  _i6.Future<_i4.Either<_i10.Failure, void>> call(_i12.NoParams? params) =>
      (super.noSuchMethod(Invocation.method(#call, [params]),
              returnValue: Future<_i4.Either<_i10.Failure, void>>.value(
                  _FakeEither_2<_i10.Failure, void>()))
          as _i6.Future<_i4.Either<_i10.Failure, void>>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [UpdateUserInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockUpdateUserInfo extends _i1.Mock implements _i14.UpdateUserInfo {
  MockUpdateUserInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.UserProfileRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
              returnValue: _FakeUserProfileRepository_1())
          as _i3.UserProfileRepository);
  @override
  _i6.Future<_i4.Either<_i10.Failure, void>> call(
          _i14.UpdateUserRequestParams? params) =>
      (super.noSuchMethod(Invocation.method(#call, [params]),
              returnValue: Future<_i4.Either<_i10.Failure, void>>.value(
                  _FakeEither_2<_i10.Failure, void>()))
          as _i6.Future<_i4.Either<_i10.Failure, void>>);
  @override
  String toString() => super.toString();
}

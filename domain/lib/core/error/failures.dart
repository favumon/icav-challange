import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? message;

  Failure({this.message});
  @override
  List<Object> get props => [];
}

class LocalStorageFailure extends Failure {
  LocalStorageFailure({String? message}) : super(message: message);
}

class SignupFailure extends Failure {
  SignupFailure({String? message}) : super(message: message);
}

class LoginFailure extends Failure {
  LoginFailure({String? message}) : super(message: message);
}

class UserProfileFailure extends Failure {
  UserProfileFailure({String? message}) : super(message: message);
}

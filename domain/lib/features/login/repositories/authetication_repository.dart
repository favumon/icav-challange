import 'package:dartz/dartz.dart';
import 'package:domain/core/entities/user.dart';
import 'package:domain/core/error/failures.dart';
import 'package:domain/features/login/entities/login_credentials.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, User>> autheticateUser(
      {required LoginCredentials loginCredentials});
}

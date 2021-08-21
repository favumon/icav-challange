import 'package:dartz/dartz.dart';
import 'package:domain/core/entities/user.dart';
import 'package:domain/core/error/failures.dart';
import 'package:domain/features/signup/entities/signup_response.dart';

abstract class UserSignupRepository {
  Future<Either<Failure, SignupResponse>> submitSignupInfo(
      {required User signupInfo});
}

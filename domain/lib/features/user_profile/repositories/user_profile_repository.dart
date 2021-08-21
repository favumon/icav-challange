import 'package:dartz/dartz.dart';
import 'package:domain/core/entities/user.dart';
import 'package:domain/core/error/failures.dart';

abstract class UserProfileRepository {
  Future<Either<Failure, User>> getUserInfo();
  Future<Either<Failure, void>> logoutUser();
  Future<Either<Failure, void>> updateUserInfo(User user);
}

import 'package:dartz/dartz.dart';
import 'package:data/core/models/user_model.dart';
import 'package:data/features/signup/datasource/user_signup_local_data_soure.dart';
import 'package:domain/core/entities/user.dart';
import 'package:domain/core/error/failures.dart';
import 'package:domain/features/signup/entities/signup_response.dart';
import 'package:domain/features/signup/repositories/user_signup_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserSignupRepository)
class UserSignupRepositoryImpl extends UserSignupRepository {
  final UserSignupLocalDataSource _userSignupRemoteDataSource;

  UserSignupRepositoryImpl(this._userSignupRemoteDataSource);

  @override
  Future<Either<Failure, SignupResponse>> submitSignupInfo(
      {required User signupInfo}) async {
    return await _userSignupRemoteDataSource.submitSignupInfo(UserModel(
        name: signupInfo.name,
        email: signupInfo.email,
        phone: signupInfo.phone,
        username: signupInfo.username,
        password: signupInfo.password));
  }
}

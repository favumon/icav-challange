import 'package:dartz/dartz.dart';
import 'package:data/core/models/user_model.dart';
import 'package:data/features/user_profile/datasource/user_profile_local_data_soure.dart';
import 'package:domain/core/entities/user.dart';
import 'package:domain/core/error/failures.dart';
import 'package:domain/features/user_profile/repositories/user_profile_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserProfileRepository)
class UserProfileRepositoryImpl extends UserProfileRepository {
  final UserProfileLocalDataSource _userProfileLocalDataSource;

  UserProfileRepositoryImpl(this._userProfileLocalDataSource);

  @override
  Future<Either<Failure, User>> getUserInfo() async {
    return await _userProfileLocalDataSource.getUserInfo();
  }

  @override
  Future<Either<Failure, void>> logoutUser() async {
    return await _userProfileLocalDataSource.logoutUser();
  }

  @override
  Future<Either<Failure, void>> updateUserInfo(User user) async {
    return await _userProfileLocalDataSource.updateUserInfo(UserModel(
        name: user.name,
        email: user.email,
        phone: user.phone,
        username: user.username,
        password: user.password));
  }
}

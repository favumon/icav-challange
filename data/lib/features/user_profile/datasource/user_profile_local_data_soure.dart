import 'package:dartz/dartz.dart';
import 'package:data/core/models/user_model.dart';
import 'package:data/core/utils/extentions.dart';
import 'package:data/features/login/datasource/authetication_local_data_soure.dart';
import 'package:domain/core/error/failures.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

const loggedinUserbox = 'loggedin_user';

@lazySingleton
class UserProfileLocalDataSource {
  final HiveInterface hive;

  UserProfileLocalDataSource(this.hive);

  Future<Either<Failure, UserModel>> getUserInfo() async {
    try {
      final box = await hive.openBox<UserModel>(loggedinUserbox);

      final user = box.get('user');

      return user == null ? Left(UserProfileFailure()) : Right(user);
    } catch (e) {
      return Left(UserProfileFailure());
    }
  }

  Future<Either<Failure, void>> updateUserInfo(UserModel userModel) async {
    try {
      final registrationBox =
          await hive.openBox<UserModel>(userRegistrationBox);

      final user = findExistingUser(userModel, registrationBox);
      if (user != null) {
        return Left(
            UserProfileFailure(message: generateErrorMessage(user, userModel)));
      }

      final box = await hive.openBox<UserModel>(loggedinUserbox);

      box.put('user', userModel);

      registrationBox.put(userModel.username, userModel);

      return Right(null);
    } catch (e) {
      return Left(UserProfileFailure());
    }
  }

  Future<Either<Failure, void>> logoutUser() async {
    final box = await hive.openBox<UserModel>(loggedinUserbox);

    box.clear();
    return Right(null);
  }

  String generateErrorMessage(UserModel user, UserModel signupInfo) {
    if (user.email.toLowerCase() == signupInfo.email.toLowerCase())
      return 'Email already exists';
    else if (user.phone.toLowerCase() == signupInfo.phone.toLowerCase())
      return 'Phone number already exists';
    else if (user.username.toLowerCase() == signupInfo.username.toLowerCase())
      return 'Username already exists';
    else
      return 'Signup failure';
  }

  UserModel? findExistingUser(UserModel user, Box<UserModel> box) {
    return box.values.firstWhereOrNull((element) {
      return user.username != element.username &&
          (element.email.toLowerCase() == user.email.toLowerCase() ||
              element.phone.toLowerCase() == user.phone.toLowerCase() ||
              element.username.toLowerCase() == user.username.toLowerCase());
    });
  }

  @disposeMethod
  void dispose() {
    hive.close();
  }
}

import 'package:dartz/dartz.dart';
import 'package:data/core/models/user_model.dart';
import 'package:data/core/utils/extentions.dart';
import 'package:data/features/signup/models/signup_response_model.dart';
import 'package:domain/core/error/failures.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

const userUegistrations = 'user_registrations';

@lazySingleton
class UserSignupLocalDataSource {
  final HiveInterface hive;

  UserSignupLocalDataSource(this.hive) {
    openUserBox();
  }

  Future<void> openUserBox() async {
    await hive.openBox<UserModel>(userUegistrations);
  }

  Future<Either<Failure, SignupResponseModel>> submitSignupInfo(
      UserModel signupInfo) async {
    try {
      final box = hive.box<UserModel>(userUegistrations);

      final user = findExistingUser(signupInfo, box);
      if (user != null)
        return Left(
            SignupFailure(message: generateErrorMessage(user, signupInfo)));

      box.put(signupInfo.username, signupInfo);
      return Right(SignupResponseModel());
    } catch (e) {
      return Left(SignupFailure());
    }
  }

  UserModel? findExistingUser(UserModel signupInfo, Box<UserModel> box) {
    return box.values.firstWhereOrNull((element) {
      return element.email.toLowerCase() == signupInfo.email.toLowerCase() ||
          element.phone == signupInfo.phone ||
          element.username.toLowerCase() == signupInfo.username.toLowerCase();
    });
  }

  String generateErrorMessage(UserModel user, UserModel signupInfo) {
    if (user.email.toLowerCase() == signupInfo.email.toLowerCase())
      return 'Email already exists';
    else if (user.phone == signupInfo.phone)
      return 'Phone number already exists';
    else if (user.username.toLowerCase() == signupInfo.username.toLowerCase())
      return 'Username already exists';
    else
      return 'Signup failure';
  }

  @disposeMethod
  void dispose() {
    hive.close();
  }
}

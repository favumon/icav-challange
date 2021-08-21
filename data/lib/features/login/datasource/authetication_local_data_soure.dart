import 'package:dartz/dartz.dart';
import 'package:data/core/models/user_model.dart';
import 'package:data/core/utils/extentions.dart';
import 'package:data/features/login/models/login_credentials_model.dart';
import 'package:data/features/user_profile/datasource/user_profile_local_data_soure.dart';
import 'package:domain/core/error/failures.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

const userRegistrationBox = 'user_registrations';

@lazySingleton
class AutheticationLocalDataSource {
  final HiveInterface hive;

  AutheticationLocalDataSource(this.hive) {
    openUserBox();
  }

  Future<void> openUserBox() async {
    await hive.openBox<UserModel>(userRegistrationBox);
  }

  Future<Either<Failure, UserModel>> autheticateUser(
      LoginCredentialsModel creds) async {
    try {
      final box = hive.box<UserModel>(userRegistrationBox);

      final user = findExistingUser(creds, box);
      if (user == null)
        return Left(LoginFailure(message: 'Invalid Username or Password'));

      final userbox = await hive.openBox<UserModel>(loggedinUserbox);

      userbox.put('user', user);

      return Right(user);
    } catch (e) {
      return Left(LoginFailure(message: 'Login falied'));
    }
  }

  UserModel? findExistingUser(
      LoginCredentialsModel signupInfo, Box<UserModel> box) {
    return box.values.firstWhereOrNull((element) {
      return element.username.toLowerCase() ==
              signupInfo.username.toLowerCase() &&
          element.password.toLowerCase() == signupInfo.password.toLowerCase();
    });
  }

  @disposeMethod
  void dispose() {
    hive.close();
  }
}

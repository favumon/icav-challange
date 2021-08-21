import 'package:dartz/dartz.dart';
import 'package:data/core/models/user_model.dart';
import 'package:data/features/login/datasource/authetication_local_data_soure.dart';
import 'package:data/features/login/models/login_credentials_model.dart';
import 'package:data/features/signup/datasource/user_signup_local_data_soure.dart';
import 'package:data/features/signup/models/signup_response_model.dart';
import 'package:domain/core/entities/user.dart';
import 'package:domain/core/error/failures.dart';
import 'package:domain/features/login/entities/login_credentials.dart';
import 'package:domain/features/login/repositories/authetication_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthenticationRepository)
class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final AutheticationLocalDataSource _autheticationLocalDataSource;

  AuthenticationRepositoryImpl(this._autheticationLocalDataSource);

  @override
  Future<Either<Failure, User>> autheticateUser(
      {required LoginCredentials loginCredentials}) async {
    return await _autheticationLocalDataSource.autheticateUser(
        LoginCredentialsModel(
            username: loginCredentials.username,
            password: loginCredentials.password));
  }
}

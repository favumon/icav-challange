import 'package:dartz/dartz.dart';
import 'package:domain/core/entities/user.dart';
import 'package:domain/core/error/failures.dart';
import 'package:domain/core/usecases/usecase.dart';
import 'package:domain/features/login/entities/login_credentials.dart';
import 'package:domain/features/login/entities/login_response.dart';
import 'package:domain/features/login/repositories/authetication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthenticateUser implements UseCase<User, AutheticationRequestParams> {
  final AuthenticationRepository repository;

  AuthenticateUser(this.repository);

  @override
  Future<Either<Failure, User>> call(AutheticationRequestParams params) async {
    return await repository.autheticateUser(
        loginCredentials: LoginCredentials(
            username: params.username, password: params.password));
  }
}

class AutheticationRequestParams extends Equatable {
  final String username;
  final String password;

  AutheticationRequestParams(this.username, this.password);
  @override
  List<Object> get props => [this.username, this.password];
}

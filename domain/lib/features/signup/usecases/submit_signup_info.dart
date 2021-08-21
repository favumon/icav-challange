import 'package:dartz/dartz.dart';
import 'package:domain/core/entities/user.dart';
import 'package:domain/core/error/failures.dart';
import 'package:domain/core/usecases/usecase.dart';
import 'package:domain/features/signup/entities/signup_response.dart';
import 'package:domain/features/signup/repositories/user_signup_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SubmitSignupInfo implements UseCase<SignupResponse, SignupRequestParams> {
  final UserSignupRepository repository;

  SubmitSignupInfo(this.repository);

  @override
  Future<Either<Failure, SignupResponse>> call(
      SignupRequestParams params) async {
    return await repository.submitSignupInfo(signupInfo: params.signupInfo);
  }
}

class SignupRequestParams extends Equatable {
  final User signupInfo;

  SignupRequestParams(this.signupInfo);
  @override
  List<Object> get props => [signupInfo];
}

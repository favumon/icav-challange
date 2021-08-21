import 'package:dartz/dartz.dart';
import 'package:domain/core/entities/user.dart';
import 'package:domain/core/error/failures.dart';
import 'package:domain/core/usecases/usecase.dart';
import 'package:domain/features/login/entities/login_credentials.dart';
import 'package:domain/features/login/entities/login_response.dart';
import 'package:domain/features/login/repositories/authetication_repository.dart';
import 'package:domain/features/user_profile/repositories/user_profile_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUserInfo implements UseCase<User, NoParams> {
  final UserProfileRepository repository;

  GetUserInfo(this.repository);

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await repository.getUserInfo();
  }
}

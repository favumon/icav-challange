import 'package:dartz/dartz.dart';
import 'package:domain/core/error/failures.dart';
import 'package:domain/core/usecases/usecase.dart';
import 'package:domain/features/user_profile/repositories/user_profile_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LogoutUser implements UseCase<void, NoParams> {
  final UserProfileRepository repository;

  LogoutUser(this.repository);

  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return repository.logoutUser();
  }
}

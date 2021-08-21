import 'package:dartz/dartz.dart';
import 'package:domain/core/entities/user.dart';
import 'package:domain/core/error/failures.dart';
import 'package:domain/core/usecases/usecase.dart';
import 'package:domain/features/user_profile/repositories/user_profile_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UpdateUserInfo implements UseCase<void, UpdateUserRequestParams> {
  final UserProfileRepository repository;

  UpdateUserInfo(this.repository);

  @override
  Future<Either<Failure, void>> call(UpdateUserRequestParams params) async {
    return await repository.updateUserInfo(User(
        name: params.user.name,
        email: params.user.email,
        phone: params.user.phone,
        username: params.user.username,
        password: params.user.password));
  }
}

class UpdateUserRequestParams extends Equatable {
  final User user;

  UpdateUserRequestParams(this.user);
  @override
  List<Object> get props => [user];
}

import 'package:domain/core/entities/user.dart';
import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends User {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String phone;
  @HiveField(3)
  final String username;
  @HiveField(4)
  final String password;

  UserModel(
      {required this.name,
      required this.email,
      required this.phone,
      required this.username,
      required this.password})
      : super(
            email: email,
            name: name,
            password: password,
            phone: phone,
            username: username);
}

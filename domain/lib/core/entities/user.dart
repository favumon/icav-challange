import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final String email;
  final String phone;
  final String username;
  final String password;
  User(
      {required this.name,
      required this.email,
      required this.phone,
      required this.username,
      required this.password});

  @override
  List<Object?> get props => [name, email, phone, username, password];
}

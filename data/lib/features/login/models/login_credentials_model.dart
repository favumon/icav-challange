import 'package:domain/features/login/entities/login_credentials.dart';

class LoginCredentialsModel extends LoginCredentials {
  final String username;
  final String password;

  LoginCredentialsModel({required this.username, required this.password})
      : super(username: username, password: password);
}

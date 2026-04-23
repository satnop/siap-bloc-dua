part of 'login_bloc.dart';

abstract class LoginEvent {}

class LoadSavedLogin extends LoginEvent {}

class PasswordVisibilityToggled extends LoginEvent {}

class LoginSubmitted extends LoginEvent {
  final String pid;
  final String password;

  LoginSubmitted({required this.pid, required this.password});
}

// class LoginData extends LoginEvent {
//   final String kodebagian;
//   LoginData(this.kodebagian);
// }

class LogoutRequested extends LoginEvent {}

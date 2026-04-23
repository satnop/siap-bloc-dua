part of 'login_bloc.dart';

abstract class LoginState {
  final bool showPassword;
  const LoginState({this.showPassword = false});
}

final class LoginInitial extends LoginState {
  const LoginInitial({bool showPassword = false})
    : super(showPassword: showPassword);
}

class LoginPrefilled extends LoginState {
  final String pid;
  final String password;

  LoginPrefilled({
    required this.pid,
    required this.password,
    bool showPassword = false,
  }) : super(showPassword: showPassword);
}

class LoginLoading extends LoginState {
  const LoginLoading({bool showPassword = false})
    : super(showPassword: showPassword);
}

class LoginSuccess extends LoginState {
  final String role;

  LoginSuccess(this.role, {bool showPassword = false})
    : super(showPassword: showPassword);
}

// class LoginData extends LoginState {
//   final LoginModel user;
//   LoginData(this.user);
// }

class LoginFailure extends LoginState {
  final String message;

  LoginFailure(this.message, {bool showPassword = false})
    : super(showPassword: showPassword);
}

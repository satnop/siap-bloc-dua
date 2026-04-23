part of 'login_bloc.dart';

abstract class LoginState {
  final bool showPassword;
  const LoginState({this.showPassword = false});
}

final class LoginInitial extends LoginState {
  const LoginInitial({super.showPassword});
}

class LoginPrefilled extends LoginState {
  final String pid;
  final String password;

  LoginPrefilled({
    required this.pid,
    required this.password,
    super.showPassword,
  });
}

class LoginLoading extends LoginState {
  const LoginLoading({super.showPassword});
}

class LoginSuccess extends LoginState {
  final String role;

  LoginSuccess(this.role, {super.showPassword});
}

// class LoginData extends LoginState {
//   final LoginModel user;
//   LoginData(this.user);
// }

class LoginFailure extends LoginState {
  final String message;

  LoginFailure(this.message, {super.showPassword});
}

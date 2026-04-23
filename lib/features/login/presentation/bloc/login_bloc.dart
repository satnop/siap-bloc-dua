import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siap/data/repositories/auth_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository repository;

  LoginBloc(this.repository) : super(const LoginInitial()) {
    on<LoadSavedLogin>(_onLoadSavedLogin);
    on<PasswordVisibilityToggled>(_onPasswordVisibilityToggled);
    on<LoginSubmitted>(_onLogin);
  }

  Future<void> _onLoadSavedLogin(
    LoadSavedLogin event,
    Emitter<LoginState> emit,
  ) async {
    final pid = await repository.localStorage.getPid();
    emit(LoginPrefilled(pid: pid ?? '', password: ''));
  }

  Future<void> _onPasswordVisibilityToggled(
    PasswordVisibilityToggled event,
    Emitter<LoginState> emit,
  ) async {
    final current = state;
    final newShowPassword = !current.showPassword;

    if (current is LoginPrefilled) {
      emit(
        LoginPrefilled(
          pid: current.pid,
          password: current.password,
          showPassword: newShowPassword,
        ),
      );
      return;
    }

    if (current is LoginLoading) {
      emit(LoginLoading(showPassword: newShowPassword));
      return;
    }

    if (current is LoginSuccess) {
      emit(LoginSuccess(current.role, showPassword: newShowPassword));
      return;
    }

    if (current is LoginFailure) {
      emit(LoginFailure(current.message, showPassword: newShowPassword));
      return;
    }

    emit(LoginInitial(showPassword: newShowPassword));
  }

  Future<void> _onLogin(LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(LoginLoading(showPassword: state.showPassword));

    try {
      final user = await repository.login(event.pid, event.password);
      emit(LoginSuccess(user.kodebagian, showPassword: state.showPassword));
    } catch (e) {
      emit(LoginFailure(e.toString(), showPassword: state.showPassword));
    }
  }
}

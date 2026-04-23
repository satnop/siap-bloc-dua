import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siap/core/constants/constan.dart';
import 'package:siap/features/login/presentation/bloc/login_bloc.dart';
import 'package:siap/features/mekanik/presentation/pages/mks_home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginFormkey = GlobalKey<FormState>();
  final TextEditingController _pidController = TextEditingController();
  final TextEditingController _pswdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LoginBloc>().add(LoadSavedLogin());
    });
  }

  @override
  void dispose() {
    _pidController.dispose();
    _pswdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginPrefilled) {
              if (state.pid.isNotEmpty && _pidController.text != state.pid) {
                _pidController.text = state.pid;
              }
            }
            if (state is LoginSuccess) {
              Widget page;
              switch (state.role) {
                case 'MS':
                  page = const MksHome();
                  break;
                default:
                  page = const LoginPage();
              }
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => page),
              );
            }
            if (state is LoginFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            final showPassword = state.showPassword;
            return Form(
              child: ListView(
                children: [
                  SizedBox(
                    height: 250,
                    child: Image.asset("assets/images/logosiap.jpg"),
                  ),
                  TextFormField(
                    controller: _pidController,
                    textCapitalization: TextCapitalization.characters,
                    validator:
                        (value) => value!.isEmpty ? 'Nama Required' : null,
                    decoration: const InputDecoration(labelText: 'NO PID'),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _pswdController,
                    obscureText: !showPassword,
                    textCapitalization: TextCapitalization.characters,
                    validator:
                        (value) => value!.isEmpty ? 'Password Required' : null,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          context.read<LoginBloc>().add(
                            PasswordVisibilityToggled(),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton.icon(
                    onPressed: () {
                      context.read<LoginBloc>().add(
                        LoginSubmitted(
                          pid: _pidController.text,
                          password: _pswdController.text,
                        ),
                      );
                    },
                    label: const Text("Login"),
                    icon: const Icon(Icons.key),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MyPalette.menuBluebird,
                      minimumSize: const Size(100, 50),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Ganti Password',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

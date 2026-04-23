import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siap/app/app.dart';
import 'package:siap/core/services/api_service.dart';
import 'package:siap/core/services/local_storage_service.dart';
import 'package:siap/data/repositories/auth_repository.dart';
import 'package:siap/features/login/presentation/bloc/login_bloc.dart';

void main() {
  final apiService = ApiService();
  final storage = LocalStorageService();
  final authRepository = AuthRepository(apiService, storage);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => LoginBloc(authRepository),
        ),
      ],
      child: const App(),
    ),
  );
}

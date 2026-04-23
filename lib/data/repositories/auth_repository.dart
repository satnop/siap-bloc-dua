import 'package:siap/core/services/api_service.dart';
import 'package:siap/core/services/local_storage_service.dart';
import 'package:siap/data/models/auth/user_model.dart';

class AuthRepository {
  final ApiService apiService;
  final LocalStorageService localStorage;

  AuthRepository(this.apiService, this.localStorage);

  Future<UserModel> login(String pid, String password) async {
    final data = await apiService.post('otentikasi/login', {
      'pid': pid,
      'pass': password,
    });

    if (data['error'] == true) {
      throw Exception(data['message']);
    }

    final user = UserModel.fromJson(data['user']);

    await localStorage.saveUser(
      pid: user.pid,
      nama: user.nama,
      gedung: user.gedung ?? '',
      kodebagian: user.kodebagian,
      password: password,
    );

    return user;
  }
}

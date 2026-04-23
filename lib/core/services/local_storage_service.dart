import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  Future<void> saveUser({
    required String pid,
    required String nama,
    required String gedung,
    required String kodebagian,
    required String password,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('pid', pid);
    await prefs.setString('nama', nama);
    await prefs.setString('gedung', gedung);
    await prefs.setString('kodebagian', kodebagian);
    await prefs.setString('password', password);
  }

  Future<String?> getKodebagian() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('kodebagian');
  }

  Future<String?> getNama() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('nama');
  }

  Future<void> savePid(String pid) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('pid', pid);
  }

  Future<void> savePswd(String passw) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('password', passw);
  }

  Future<String?> getPid() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('pid');
  }

  Future<String?> getPswd() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('password');
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('pid');
  }

  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}

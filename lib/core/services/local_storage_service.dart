import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  Future<void> saveUser({
    required String pid,
    required String nama,
    required String gedung,
    required String kodebagian,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('pid', pid);
    await prefs.setString('nama', nama);
    await prefs.setString('gedung', gedung);
    await prefs.setString('kodebagian', kodebagian);
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
    await prefs.setString('pswd', passw);
  }

  Future<String?> getPid() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('pid');
  }

  Future<String?> getPswd() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('pswd');
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

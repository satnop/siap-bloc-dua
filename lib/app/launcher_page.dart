import 'package:flutter/material.dart';
import 'package:siap/core/services/local_storage_service.dart';
import 'package:siap/features/login/presentation/pages/login_page.dart';

class LauncherPage extends StatelessWidget {
  final LocalStorageService storage = LocalStorageService();

  LauncherPage({super.key});

  Future<Widget> _getPage() async {
    final isLogin = await storage.isLoggedIn();

    if (!isLogin) return const LoginPage();

    final role = await storage.getKodebagian();

    switch (role) {
      case 'MS':
        return const LoginPage();
      case 'SC':
        return const LoginPage();
      default:
        return const LoginPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getPage(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        }
        return snapshot.data!;
      },
    );
  }
}

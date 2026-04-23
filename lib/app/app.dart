import 'package:flutter/material.dart';
import 'package:siap/app/launcher_page.dart';
import 'package:siap/core/constants/constan.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Siap',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'NeoSans',
        primaryColor: MyPalette.green,
      ),
      home: LauncherPage(),
    );
  }
}

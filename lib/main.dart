import 'package:flutter/material.dart';
import 'package:qlorian/qlorian.dart';
import 'src/views/login_page/login_page.dart';

void main() {
  runApp(const QlorianApp());
}

class QlorianApp extends StatelessWidget {
  const QlorianApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'qlorian',
      theme: themeLight,
      home: const LoginPage(),
    );
  }
}

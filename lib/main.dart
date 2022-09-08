import 'package:flutter/material.dart';
import 'package:qlorian/qlorian.dart';
import 'src/views/login_page/login_page.dart';

void main() {
  runApp(const qlorianApp());
}

class qlorianApp extends StatelessWidget {
  const qlorianApp({Key? key}) : super(key: key);

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

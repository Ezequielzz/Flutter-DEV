import 'package:flutter/material.dart';
import 'package:sa2_correcao/View/LoginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sa2 SQLite',
      home: LoginPage(),
    );
  }
}

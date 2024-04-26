import 'package:flutter/material.dart';
import 'package:persistencia_json/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Persistência JSON',
      color: Color.fromARGB(255, 255, 228, 171),
      home: HomePage(),
    );
  }
}

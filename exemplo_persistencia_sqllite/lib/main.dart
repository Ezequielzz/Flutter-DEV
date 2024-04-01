import 'package:exemplo_persistencia_sqllite/View.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Persistência de Dados SQLite",
      theme: ThemeData(primaryColor: Color.fromARGB(255, 0, 255, 255)),
      home: HomePage(),
    );
  }
}

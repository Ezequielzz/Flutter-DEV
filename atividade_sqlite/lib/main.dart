import 'package:atividade_sqlite/HomeView.dart';
import 'package:atividade_sqlite/LoginView.dart';
import 'package:flutter/material.dart';
import 'package:atividade_sqlite/CadastroView.dart';

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
      home: LoginScreen(),
    );
  }
} 
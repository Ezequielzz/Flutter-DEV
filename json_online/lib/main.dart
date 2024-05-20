import 'package:flutter/material.dart';
import 'package:json_online/View/filme_cadastro_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Projeto Json",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: FilmeCadastroScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
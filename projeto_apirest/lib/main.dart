import 'package:flutter/material.dart';
import 'package:projeto_apirest/Screens/cadatro_screen.dart';
import 'package:projeto_apirest/Screens/home_screen.dart';
import 'package:projeto_apirest/Screens/produtos_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Rest',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => const HomeScreen(),
        '/listar': (context) => const ProdutoScreen(),
        '/cadastrar': (context) => const CadatroScreen()
      },
    );
  }
}

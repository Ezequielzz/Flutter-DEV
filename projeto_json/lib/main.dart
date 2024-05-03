import 'package:flutter/material.dart';
import 'package:projeto_json/Screens/filme_cadastro_screen.dart';
import 'package:projeto_json/Screens/filme_list_screen.dart';
import 'package:projeto_json/Screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projeto Json',
      color: Color.fromARGB(255, 72, 34, 160), 
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/home':(context) => HomeScreen(),
        '/list':(context) => FilmeListScreen(),
        '/cadastro':(context) => FilmeCadastroScreen()
      },
    );
  }
}

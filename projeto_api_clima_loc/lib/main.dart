import 'package:flutter/material.dart';
import 'package:projeto_api_clima_loc/Screens/citydetail.dart';
import 'package:projeto_api_clima_loc/Screens/home_screen.dart';
import 'package:projeto_api_clima_loc/Screens/search_screen.dart';
import 'package:projeto_api_clima_loc/Screens/favorites_screen.dart';




void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Projeto Clima",
      home: HomeScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/search':(context) => SearchScreen(),
      },
    );
  }
}
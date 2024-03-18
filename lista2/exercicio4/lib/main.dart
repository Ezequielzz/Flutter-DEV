import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:exercicio4/CadastroController.dart';
import 'package:exercicio4/CadastroView.dart'; // Importe sua CadastroView aqui

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CadastroController(),
      child: MaterialApp(
        title: 'MyApp',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CadastroView(), // Defina sua CadastroView como a tela inicial do aplicativo
      ),
    );
  }
}

import 'package:app_animais/View.dart';
import 'package:app_animais/Controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListaAnimaisApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Definindo a Tela inicial como a ListaTarefasScreen
      home: ChangeNotifierProvider(
        create: (context) => AnimalController(),
        child: TelaListaAnimais(),
      ),
    );
  }
}
import 'package:app_lista1/ListaTarefaScreen.dart';
import 'package:app_lista1/TarefaController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListaTarefasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Definindo a Tela inicial como a ListaTarefasScreen
      home: ChangeNotifierProvider(
        create: (context) => ListaTarefasController(),
        child: ListaTarefasScreen(),
      ),
    );
  }
}
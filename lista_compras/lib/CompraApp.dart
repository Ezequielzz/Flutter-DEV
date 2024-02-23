import 'package:lista_compras/CompraController.dart';
import 'package:lista_compras/CompraView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListaCompraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Definindo a Tela inicial como a ListaTarefasScreen
      home: ChangeNotifierProvider(
        create: (context) => ListaCompraController(),
        child: ListaCompraScreen(),
      ),
    );
  }
}
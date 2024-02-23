import 'package:lista_compras/CompraModel.dart';
import 'package:flutter/material.dart';

class ListaCompraController extends ChangeNotifier {
  // Lista de Compras
  List<Compra> _compras = [];

// Gettar, para acessar a lista de Compras
  List<Compra> get compras => _compras;

  // Métodos CRUD

  // Método para adicionar uma Compra à lista 
  void adicionarCompra(String descricao, BuildContext context) {
    if (descricao.trim().isNotEmpty)
    // Verifica se a compra já existe na lista
    if (!_compras.any((compra) => compra.descricao == descricao)) {
      // Se não existe, adiciona à lista
      _compras.add(Compra(descricao.trim(), false));
      // Notifica os ouvintes (widgets) sobre a mudança no estado
    notifyListeners();
    } else {
      print("Este produto já existe na sua lista");
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Compras"),
              content: Text("Item já existe"),
            );
          });
      Future.delayed(Duration(milliseconds: 1000), () {
        Navigator.pop(context);
      });
    }
  }

  // Método para marcar uma Compra como concluída com base no índice
  void marcarComoConcluida(int indice) {
    if (indice >= 0 && indice < _compras.length) {
      _compras[indice].concluida = true;
      // Notifica os ouvintes (widgets) sobre a mudança no estado
      notifyListeners();
    }
  }

  // Método para desmarcar uma Compra como concluída com base no índice
  void desmarcarComoConcluida(int indice) {
    if (indice >= 0 && indice < _compras.length) {
      _compras[indice].concluida = false;
      // Notifica os ouvintes (widgets) sobre a mudança no estado
      notifyListeners();
    }
  }

   // Método para editar uma compra
  void editarCompra(int index, String novaDescricao) {
    _compras[index].descricao = novaDescricao;
    notifyListeners();
  }

  // Método para excluir uma Compra como concluída com base no índice
  void excluirCompra(int indice) {
    if (indice >= 0 && indice < _compras.length) {
      _compras.removeAt(indice);
      // Notifica os ouvintes (widgets) sobre a mudança no estado
      notifyListeners();
    }
  }
}
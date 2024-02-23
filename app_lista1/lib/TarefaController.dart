import 'package:app_lista1/TarefaModel.dart';
import 'package:flutter/material.dart';

class ListaTarefasController extends ChangeNotifier {
  // Lista de Tarefas
  List<Tarefa> _tarefas = [];

// Gettar, para acessar a lista de tarefas
  List<Tarefa> get tarefas => _tarefas;

  // Métodos CRUD

  // Método para adicionar uma tarefa à lista 
  void adicionarTarefa(String descricao) {
    if (descricao.trim().isNotEmpty)
    _tarefas.add(Tarefa(descricao.trim(), false));
    // Notifica os ouvintes (widgets) sobre a mudança no estado
    notifyListeners();
  }

  // Método para marcar uma tarefa como concluída com base no índice
  void marcarComoConcluida(int indice) {
    if (indice >= 0 && indice < _tarefas.length) {
      _tarefas[indice].concluida = true;
      // Notifica os ouvintes (widgets) sobre a mudança no estado
      notifyListeners();
    }
  }

  // Método para desmarcar uma tarefa como concluída com base no índice
  void desmarcarComoConcluida(int indice) {
    if (indice >= 0 && indice < _tarefas.length) {
      _tarefas[indice].concluida = false;
      // Notifica os ouvintes (widgets) sobre a mudança no estado
      notifyListeners();
    }
  }

  // Método para excluir uma tarefa como concluída com base no índice
  void excluirTarefa(int indice) {
    if (indice >= 0 && indice < _tarefas.length) {
      _tarefas.removeAt(indice);
      // Notifica os ouvintes (widgets) sobre a mudança no estado
      notifyListeners();
    }
  }
}
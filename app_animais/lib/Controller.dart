import 'package:app_animais/Model.dart';
import 'package:flutter/material.dart';

class AnimalController extends ChangeNotifier{
  // Atributo
  List<Animal> _listaAnimal = [];

  // Get da Lista
  List get listarAnimais => _listaAnimal;

  // Método Adicionar Animal
  void adicionarAnimal(especie, urlFoto, urlAudio) {
    Animal novoAnimal = Animal(especie, urlFoto, urlAudio);
    _listaAnimal.add(novoAnimal);

    notifyListeners();
  }
  
//Método para excluir uma compra
  void excluirAnimal(int indice) {
    if (indice >= 0 && indice < _listaAnimal.length) {
      _listaAnimal.removeAt(indice);
      // Notifica os ouvintes (widgets) sobre a mudança no estado
      notifyListeners();
    }
  }
}
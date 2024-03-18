import 'package:exercicio4/CadastroModel.dart';
import 'package:flutter/material.dart';

class CadastroController extends ChangeNotifier {
  List<Usuario> _usuarios = [];

  List<Usuario> get usuarios => _usuarios;

  void adicionarUsuario(String nome, String email, String senha) {
    if (nome.trim().isNotEmpty && email.trim().isNotEmpty && senha.trim().isNotEmpty) {
      _usuarios.add(Usuario(nome.trim(), email.trim(), senha.trim()));
      notifyListeners();
    }
  }
}

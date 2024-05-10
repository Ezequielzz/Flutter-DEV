import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../Model/filme_model.dart';

class FilmeController {
  // Atributos
  List<Filme> listFilmes = [];

  // Métodos Salvar/Carregar Json
  Future<void> salvarJson() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String path = appDocDir.path;
    final file = File('$path/filmes.json');
    final jsonList = listFilmes.map((filme) => filme.toJson());
    await file.writeAsString(jsonEncode(jsonList));
  }

  Future<void> carregarJson() async {
    try {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String path = appDocDir.path;
      final file = File('$path/filmes.json');
      final jsonList = jsonDecode(await file.readAsString());
      listFilmes = jsonList.map<Filme>((json) => Filme.fromJson(json)).toList();
    } catch (e) {
      listFilmes = [];
    }
  }

  void addFilme(Filme filme) {
    listFilmes.add(filme);
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:json_online/Model/filme_model.dart';

class FilmesController {
  //atributo
  List<Filme> listFilmes = [];

  //métodos salvar / carregar json
  Future<void> saveFilmestoJson() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String path = appDocDir.path;
    final file = File('$path/filmes.json');
    final jsonList = listFilmes.map((filme) => filme.toJson()).toList();
    await file.writeAsString(jsonEncode(jsonList));
  }

  Future<void> loadFilmesfromJson() async {
    try {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String path = appDocDir.path;
      final file = File('$path/filmes.json');
      final jsonList = jsonDecode(await file.readAsString());
      listFilmes = jsonList.map<Filme>((json) => Filme.fromJson(json)).toList();
    } catch (e) {
      print(e);
      listFilmes = [];
    }
  }

  //método adicionar
  void addFilme(Filme filme) {
    listFilmes.add(filme);
  }
}
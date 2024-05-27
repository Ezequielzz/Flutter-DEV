import 'package:projeto_api_clima_loc/Service/cidade_db_service.dart';

import '../Model/cidade_db_model.dart';

class CidadeDbController {
  // Atributos
  List<CidadeDb> _cidades = [];
  final CidadeDbService _dbService = CidadeDbService();

  List<CidadeDb> getCidades() => _cidades;

  // Métodos
  Future<List<CidadeDb>> getAllCidades() async {
    try {
      List<Map<String, dynamic>> maps = await _dbService.getCidades();
      _cidades = maps.map<CidadeDb>((e) => CidadeDb.fromMap(e)).toList();
      return _cidades;
    } catch (e) {
      print(e);
      return _cidades;
    }
  }

  //create
  Future<void> create(CidadeDb db) async {
    try {
      await _dbService.insertCidade(db);
      print("adicionado");
    } catch (e) {
      print(e);
    }
  }

  Future<CidadeDb?> getCidade(String nomeCidade) async {
    try {
      List<Map<String, dynamic>> map = await _dbService.getCidade(nomeCidade);
      return CidadeDb.fromMap(map.first);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> update(CidadeDb db) async {
    try {
      await _dbService.updateCidade(db);
      print("atualizado");
    } catch (e) {
      print(e);
    }
  }
}

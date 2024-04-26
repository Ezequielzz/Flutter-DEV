import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:persistencia_json/Model/produto.dart';

class ProdutoController {
  // Atributo Privado
  List<Produto> produtos = [];

  // Métodos Para Decodificar e Codificar o .json
  // Método para carregar produtos do arquivo JSON
  Future<List<Produto>> loadProdutos() async {
    // Carrega o conteúdo do arquivo JSON da pasta assets
    final data = await rootBundle.loadString('assets/produtos.json');
    // Decodifica o conteúdo JSON em uma lista dinâmica
    final jsonList = json.decode(data) as List<dynamic>;
    // Limpa a Lista
    produtos.clear();
    // Converte os Objetos em uma Lista Dinâmica
    // Converte os objetos da Lista em instâncias de Produto e adiciona à lista de produtos
    produtos.addAll(jsonList.map((e) => Produto.fromJson(e)));

    return produtos;
  }
  
}
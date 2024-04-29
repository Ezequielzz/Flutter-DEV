import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:persistencia_json2/Model/Produtos.dart';

class ProdutosController {
  // Atributos
  List<Produto> produtos = [];

  // Métodos
  Future<List<Produto>> loadProdutos() async {
    final data = await rootBundle.loadString('assets/produtos.json');
    final jsonList = json.decode(data) as List<dynamic>;
    produtos.clear();
    produtos.addAll(jsonList.map((e) => Produto.fromJson(e)));
    return produtos;
  }
}
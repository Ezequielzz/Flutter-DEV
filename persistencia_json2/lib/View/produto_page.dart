import 'package:flutter/material.dart';
import 'package:persistencia_json2/Model/Produtos.dart';

class ProdutoPage extends StatelessWidget {
  Produto produto;

  ProdutoPage({
    required this.produto
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produto - ${produto.nome}'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          children: [
            Text(produto.nome),
            Text('${produto.preco.toStringAsFixed(2)}'),
            Text(produto.categoria),
            Image(image: AssetImage(produto.imagem))
          ],
        ),
      ),
    );
  }
}
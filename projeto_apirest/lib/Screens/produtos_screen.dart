import 'package:flutter/material.dart';
import 'package:projeto_apirest/Controller/controller.dart';
import 'package:projeto_apirest/Model/produto.dart';

class ProdutoScreen extends StatefulWidget {
  const ProdutoScreen({super.key});

  @override
  State<ProdutoScreen> createState() => _ProdutoScreenState();
}

class _ProdutoScreenState extends State<ProdutoScreen> {
  final ProdutoController _controller = ProdutoController();

  //future lista de produtos
  Future<List<Produto>> futureProdutos() async{
    try {
      return _controller.getProdutosFromJson();
    } catch (e) {
      print(e);
      return [];
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Produto>>(
        future: futureProdutos(),
        builder: (context, snapshot) {
          if (_controller.listProdutos.isNotEmpty) {
            return ListView.builder(
              itemCount: _controller.listProdutos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_controller.listProdutos[index].nome),
                  subtitle: Text((_controller.listProdutos[index].preco).toStringAsFixed(2)),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
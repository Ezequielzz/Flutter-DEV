import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:persistencia_json/Controller/produto_controller.dart';
import 'package:persistencia_json/Model/produto.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProdutoController _produtoController = ProdutoController();

  @override
  void initState() {
    _produtoController.loadProdutos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Persistência JSON'),
        backgroundColor: Color.fromARGB(255, 255, 228, 171),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder<List<Produto>>(
                  future: _produtoController.loadProdutos(),
                  builder: (context, snapshot) {
                    if (_produtoController.produtos.isNotEmpty) {
                      return ListView.builder(
                        itemCount: _produtoController.produtos.length,
                        itemBuilder: (context, index) {
                          final produto = _produtoController.produtos[index];
                          return ListTile(
                            title: Text(produto.nome),
                            subtitle: Text(
                                'Preço: ${produto.preco.toStringAsFixed(2)} - Categoria: ${produto.categoria}'),
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Color.fromARGB(255, 255, 228, 171),
                        ),
                      );
                    }
                  })),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color.fromARGB(255, 255, 228, 171),
        child: Icon(Icons.add),
      ),
    );
  }
}

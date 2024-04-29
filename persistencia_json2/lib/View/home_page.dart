import 'package:flutter/material.dart';
import 'package:persistencia_json2/Controller/produtos_controller.dart';
import 'package:persistencia_json2/Model/Produtos.dart';
import 'package:persistencia_json2/View/produto_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProdutosController controller = new ProdutosController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Produtos"),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Expanded(
          child: FutureBuilder<List<Produto>>(
              future: controller.loadProdutos(),
              builder: (context, snapshot) {
                if (controller.produtos.isNotEmpty) {
                  return ListView.builder(
                    itemCount: controller.produtos.length,
                    itemBuilder: (context, index) {
                      final produto = controller.produtos[index];
                      return ListTile(
                        title: Text(produto.nome),
                        subtitle: Text(
                            'Preço: ${produto.preco.toStringAsFixed(2)} - Categoria: ${produto.categoria}'),
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProdutoPage(produto: controller.produtos[index]))),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  );
                }
              }),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lista_compras/CompraController.dart';

class ListaCompraScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lista de compras',
          style: TextStyle(
            color: Colors.white, // Define a cor do texto da AppBar
            fontWeight: FontWeight.bold, // Define o peso da fonte como negrito
          ),
        ),
        backgroundColor: Color.fromARGB(255, 0, 153, 255), // Define a cor da AppBar
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Nova Compra',
                suffixIcon: IconButton(
                  onPressed: () {
                    if (_controller.text.length < 1) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Aviso'),
                            content:
                                Text("Não é possível inserir um item vazio"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("OK"),
                              )
                            ],
                          );
                        },
                      );
                    } else {
                      Provider.of<ListaCompraController>(context, listen: false)
                          .adicionarCompra(_controller.text, context);

                      //Limpar o campo de texto após adicionar tarefa
                      _controller.clear();
                    }
                  },
                  icon: Icon(Icons.add),
                ),
              ),
            ),
          ),
          Expanded(
            child: Consumer<ListaCompraController>(
              builder: (context, model, child) {
                return ListView.builder(
                  itemCount: model.compras.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(model.compras[index].descricao),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              _mostrarDialogoEdicao(context, model, index);
                            },
                          ),
                          Checkbox(
                            value: model.compras[index].concluida,
                            onChanged: (value) {
                              if (value != null) {
                                if (value) {
                                  model.marcarComoConcluida(index);
                                } else {
                                  model.desmarcarComoConcluida(index);
                                }
                              }
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () {
                              model.excluirCompra(index);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  _mostrarDialogoEdicao(
      BuildContext context, ListaCompraController model, int index) {
    TextEditingController _controller =
        TextEditingController(text: model.compras[index].descricao);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Editar Compra'),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: 'Nova descrição',
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                model.editarCompra(index, _controller.text);
                Navigator.of(context).pop();
              },
              child: Text('Salvar'),
            ),
          ],
        );
      },
    );
  }
}

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
            color: Color.fromARGB(
                255, 255, 230, 0), // Define a cor do texto da AppBar
            fontWeight: FontWeight.bold, // Define o peso da fonte como negrito
          ),
        ),
        backgroundColor:
            Color.fromARGB(255, 0, 60, 255), // Define a cor da AppBar
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              cursorColor: Color.fromARGB(255, 0, 50, 212), // Define a cor do cursor
              decoration: InputDecoration(
                labelText: 'Nova Compra',
                labelStyle: TextStyle(color: Colors.black),
                floatingLabelStyle:
                    TextStyle(color: Color.fromARGB(255, 0, 50, 212)),
                focusedBorder: UnderlineInputBorder(
                  // Define a "barrinha" quando o campo está focado
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 0, 60,
                          255)), // Define a cor da "barrinha" quando o campo está focado
                          
                ),
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
                            checkColor: Color.fromARGB(255, 255, 255,
                                255), // Define a cor da marca de seleção (tick)
                            activeColor: Color.fromARGB(255, 0, 60,
                                255), // Define a cor do checkbox quando está marcado
                          ),
                          IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () {
                              _mostrarDialogoExclusao(context, model, index);
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

  bool _isError = false;

  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: Text('Editar Compra'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _controller,
                  onChanged: (text) {
                    setState(() {
                      _isError = model.itemJaExiste(text);
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Nova descrição',
                    errorText: _isError ? 'Item já existe' : null,
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Color.fromARGB(
                      255, 0, 60, 255), // Define a cor do texto do botão
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancelar'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Color.fromARGB(
                      255, 0, 60, 255), // Define a cor do texto do botão
                ),
                onPressed: !_isError
                    ? () {
                        model.editarCompra(index, _controller.text, context);
                        Navigator.of(context).pop();
                      }
                    : null,
                child: Text('Salvar'),
              ),
            ],
          );
        },
      );
    },
  );
}




  _mostrarDialogoExclusao(
      BuildContext context, ListaCompraController model, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Excluir Compra'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Color.fromARGB(
                    255, 0, 60, 255), // Define a cor do texto do botão
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Color.fromARGB(
                    255, 0, 60, 255), // Define a cor do texto do botão
              ),
              onPressed: () {
                model.excluirCompra(index);
                Navigator.of(context).pop();
              },
              child: Text('Excluir'),
            ),
          ],
        );
      },
    );
  }
}

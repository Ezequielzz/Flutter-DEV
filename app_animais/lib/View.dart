import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Controller.dart';

class TelaListaAnimais extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Animais'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Novo Animal',
                suffixIcon: IconButton(
                  onPressed: () => _showDialog(context),
                  icon: Icon(Icons.add),
                ),
              ),
            ),
          ),
          Expanded(
            child: Consumer<AnimalController>(
              builder: (context, model, child) {
                return ListView.builder(
                  itemCount: model.listarAnimais.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(model.listarAnimais[index].especie),
                      onLongPress: () {
                        model.excluirAnimal(index);
                      },
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

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Adicionar Animal"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: "URL da Imagem"),
              ),
              TextField(
                decoration: InputDecoration(labelText: "URL do Áudio"),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Cancelar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Adicionar"),
              onPressed: () {
                // Adicione o código para adicionar o animal com as URLs fornecidas
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

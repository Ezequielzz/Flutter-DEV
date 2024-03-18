import 'package:exercicio4/CadastroController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CadastroView extends StatelessWidget {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Usuário'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _nomeController,
              decoration: InputDecoration(
                labelText: 'Nome',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _senhaController,
              decoration: InputDecoration(
                labelText: 'Senha',
              ),
              obscureText: true,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<CadastroController>(context, listen: false)
                  .adicionarUsuario(
                _nomeController.text,
                _emailController.text,
                _senhaController.text,
              );
              _nomeController.clear();
              _emailController.clear();
              _senhaController.clear();
            },
            child: Text('Cadastrar'),
          ),
          Expanded(
            child: Consumer<CadastroController>(
              builder: (context, model, child) {
                return ListView.builder(
                  itemCount: model.usuarios.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(model.usuarios[index].nome),
                      subtitle: Text(model.usuarios[index].email),
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
}

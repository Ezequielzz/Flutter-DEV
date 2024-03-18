import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Exercicio 4'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Cadastro(),
        ),
      ),
    );
  }
}

class Cadastro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          decoration: InputDecoration(labelText: 'Nome'),
        ),
        SizedBox(height: 16.0),
        TextField(
          decoration: InputDecoration(labelText: 'E-mail'),
        ),
        SizedBox(height: 16.0),
        TextField(
          decoration: InputDecoration(labelText: 'Senha'),
          obscureText: true,
        ),
        SizedBox(height: 32.0),
        ElevatedButton(
          onPressed: () {
            
          },
          child: Text('Cadastrar'),
        ),
      ],
    );
  }
}

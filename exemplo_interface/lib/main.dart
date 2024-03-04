// Importa o pacote de material Flutter
import 'package:flutter/material.dart';

// Função principal que inicializa a aplicação Flutter
void main() {
// Inicia a execução da aplicação com o widget MyApp
  runApp(MyApp());
}

// Definindo a classe MyApp que herda de StatelessWidget
class MyApp extends StatelessWidget {
// Método build, obrigatório em StatelessWidget, retorna a árvore de widgets da aplicação
  @override
  Widget build(BuildContext context) {
// Retorna um MaterialApp, que é o widget raiz da aplicação Flutter
    return MaterialApp(
      debugShowCheckedModeBanner: false,
// Configura a tela inicial como um Scaffold
      home: Scaffold(
// Barra superior da tela (AppBar)
        appBar: AppBar(
// Título da barra superior
          title: Text('Exemplo de Árvore de Widgets'),
        ),
// Corpo da tela, composto por um Column (coluna vertical) de widgets
        body: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.people,
                  size: 25.0,
                ),
                Text(' Nome: Teste')
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.cake,
                  size: 25.0,
                ),
                Text(' Idade: 19')],
            ),
            Row(
              children: [
                Icon(
                  Icons.house_outlined,
                  size: 25.0,
                ),
                Text(' Endereço: ABC, DEF, GHI')],
            ),
            Row(
              children: [
                Icon(
                  Icons.phone,
                  size: 25.0,
                ),
                Text(' Telefone: 19 999999999')],
            ),
            Row(
              children: [
                Icon(
                  Icons.email,
                  size: 25.0,
                ),
                Text(' Email: teste@gmail.com')],
            ),
          ],
        ),
      ),
    );
  }
}

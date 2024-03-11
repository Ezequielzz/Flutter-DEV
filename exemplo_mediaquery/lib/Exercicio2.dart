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
          title: Text("Exercicio 2"),
        ),
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

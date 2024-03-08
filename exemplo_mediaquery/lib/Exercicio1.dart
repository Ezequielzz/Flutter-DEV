import 'package:exemplo_mediaquery/ExemploMediaQuery.dart';
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
          title: Text("Exercicio 1"),
        ),
        body: Column(children: [
          Container(
            width: 100,
            height: 100,
            color: Colors.blue,
            alignment: Alignment.center,
            child: Text("Container 1"),
            ),
             Container(
            width: 200,
            height: 200,
            color: Colors.green,
            alignment: Alignment.center,
            child: Text("Container 1"),
            ),
             Container(
            width: 300,
            height: 300,
            color: Colors.red,
            alignment: Alignment.center,
            child: Text("Container 1"),
            )
        ],),
      ),
    );
  }
}
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
          title: Text("Exercicio 5"),
        ),
      body: Column(
        children: [
          Container(
            height: 200,
            alignment: Alignment.center,
            child: Row(
              
            ),
          )
        ],
      ),
      ),
    );
  }
}
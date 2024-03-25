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
          title: Text('Exercicio 8'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                'https://i.pinimg.com/736x/9e/b8/00/9eb8007417dc0ba73386f42873a0f1c5.jpg',
                width: 200,
                height: 200,
              ),
              SizedBox(height: 20),
              Image.asset(
                'assets/images/mclaren.png',
                width: 200,
                height: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

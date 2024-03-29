import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercicio 1',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Exercicio 1'),
        ),
        body: Container(
          child: Container(
            padding: EdgeInsets.all(20.0),
            color: Colors.grey[200],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hello World :)',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 30.0,
                    ),
                    Text(
                      'Flutter',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    Image.asset(
                      'assets/images/mclaren.png',
                      width: 50.0,
                      height: 50.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

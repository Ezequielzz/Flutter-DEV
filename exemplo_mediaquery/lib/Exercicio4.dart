import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Exercício 4',
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Color.fromARGB(255, 128, 41, 227),
        ),
        body: Column(
          children: [
            Container(
              color: Color.fromARGB(255, 251, 255, 0),
              height: 55,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.home, color: const Color.fromARGB(255, 0, 0, 0)),
                  Icon(Icons.search, color: const Color.fromARGB(255, 0, 0, 0)),
                  Icon(Icons.person, color: const Color.fromARGB(255, 0, 0, 0)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

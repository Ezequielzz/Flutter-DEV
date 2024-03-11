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
            TextField(
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(labelText: 'Mensagem'),
              maxLines: 3,
            ),
            SizedBox(height: 32.0),
            SizedBox(
              width: 180,
              height: 40,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Color.fromARGB(255, 115, 0, 255),
                  foregroundColor: Color.fromARGB(255, 255, 255, 255)
                ),
                child: Text(
                  "Enviar",
                  style: TextStyle(
                      fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

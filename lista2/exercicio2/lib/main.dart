import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Exercício 2"),
        ),
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                title: Text('Item ${index + 1}'),
                subtitle: Text('Descrição do item ${index + 1}'),
                leading: Icon(Icons.alarm),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {},
              ),
            );
          },
        ),
      ),
    );
  }
}
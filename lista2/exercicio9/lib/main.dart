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
          title: Text('Exercicio 9'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('ElevatedButton'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Cor de fundo
                  foregroundColor: Colors.white, // Cor do texto
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Espaçamento interno
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Borda arredondada
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {},
                child: Text('TextButton'),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.green, padding: EdgeInsets.all(15), // Espaçamento interno
                ),
              ),
              SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {},
                child: Text('OutlinedButton'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red, // Cor do texto
                  side: BorderSide(color: Colors.red), // Borda
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12), // Espaçamento interno
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Borda arredondada
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.add),
                label: Text('ElevatedButton com Ícone'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.orange, // Cor do texto
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Espaçamento interno
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Borda arredondada
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

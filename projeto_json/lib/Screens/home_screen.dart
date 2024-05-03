import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Absolute Cinema',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 72, 34, 160),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () => Navigator.pushNamed(context, '/list'), 
            child: Text('Lista de Filmes')),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: () => Navigator.pushNamed(context, '/cadastro'),
            child: Text('Cadastro de Filmes'))
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaInicial(),
    );
  }
}

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exercício 6"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/mclaren.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Text("Drawer"),
            ),
            ListTile(
              title: const Text('Tela Inicial'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Segunda Tela'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SegundaTela()),
                );
              },
            ),
            ListTile(
              title: const Text('Item 3'),
              onTap: () {
                
              },
            )
          ],
        ),
      ),
    );
  }
}

class SegundaTela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda Tela'),
      ),
      body: Center(
        child: Text(
          'Olá!',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}

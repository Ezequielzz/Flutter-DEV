import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.search)),
                Tab(icon: Icon(Icons.book)),
              ],
            ),
            title: Text("Exercício 3"),
          ),
          body: TabBarView(
            children: [
              Tab1(),
              Tab2(),
              Tab3(),
            ],
          ),
        ),
      ),
    );
  }
}

class Tab1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          children: [
            Image.asset(
              'assets/images/mclaren.png'
            )
          ],
        ),
      ),
    );
  }
}

class Tab2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 400,
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Barra de Busca',
            ),
          ),
        ),
      ),
    );
  }
}

class Tab3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}

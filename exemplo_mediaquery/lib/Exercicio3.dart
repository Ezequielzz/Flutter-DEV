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
            title: Text("Exercicio 3"),
          ),
          body: ListView(
            children: [
              Card(
                child: ListTile(
                  title: Text('Item 1'),
                  subtitle: Text('Descrição do item 1'),
                  leading: Icon(Icons.alarm),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    // Adicione ação ao clicar no card se necessário
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Item 2'),
                  subtitle: Text('Descrição do item 2'),
                  leading: Icon(Icons.attach_money),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    // Adicione ação ao clicar no card se necessário
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Item 3'),
                  subtitle: Text('Descrição do item 3'),
                  leading: Icon(Icons.zoom_in),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    // Adicione ação ao clicar no card se necessário
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Item 4'),
                  subtitle: Text('Descrição do item 4'),
                  leading: Icon(Icons.yard),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    // Adicione ação ao clicar no card se necessário
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Item 5'),
                  subtitle: Text('Descrição do item 5'),
                  leading: Icon(Icons.wallet),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    // Adicione ação ao clicar no card se necessário
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Item 6'),
                  subtitle: Text('Descrição do item 6'),
                  leading: Icon(Icons.tab),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    // Adicione ação ao clicar no card se necessário
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Item 7'),
                  subtitle: Text('Descrição do item 7'),
                  leading: Icon(Icons.face),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    // Adicione ação ao clicar no card se necessário
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Item 8'),
                  subtitle: Text('Descrição do item 8'),
                  leading: Icon(Icons.star),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    // Adicione ação ao clicar no card se necessário
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Item 9'),
                  subtitle: Text('Descrição do item 9'),
                  leading: Icon(Icons.r_mobiledata),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    // Adicione ação ao clicar no card se necessário
                  },
                ),
              ),
              Card( 
                child: ListTile(
                  title: Text('Item 10'),
                  subtitle: Text('Descrição do item 10'),
                  leading: Icon(Icons.padding),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    // Adicione ação ao clicar no card se necessário
                  },
                ),
              ),
            ],
          )),
    );
  }
}

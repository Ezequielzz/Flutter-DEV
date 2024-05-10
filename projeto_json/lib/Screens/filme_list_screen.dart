import 'dart:io';

import 'package:flutter/material.dart';
import 'package:projeto_json/Controller/filme_controller.dart';

class FilmeListScreen extends StatefulWidget {
  const FilmeListScreen({super.key});

  @override
  State<FilmeListScreen> createState() => _FilmeListScreenState();
}

class _FilmeListScreenState extends State<FilmeListScreen> {
  // Atributo
  FilmeController _controller = FilmeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lista de Filmes',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 72, 34, 160),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(17),
            child: Column(
              children: [
                Expanded(
                  child: FutureBuilder(
                      future: _controller.carregarJson(),
                      builder: (context, snapshot) {
                        if (_controller.listFilmes.isEmpty) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return ListView.builder(
                            itemCount: _controller.listFilmes.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: Image.file(
                                    File(_controller.listFilmes[index].imagem)),
                                title: Text(_controller.listFilmes[index].nome),
                                subtitle:
                                    Text(_controller.listFilmes[index].genero),
                              );
                            },
                          );
                        }
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

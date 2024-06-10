import 'package:exemplo_firebase_ezequielzz/Controller/todolist_controller.dart';
import 'package:exemplo_firebase_ezequielzz/Services/auth_firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:exemplo_firebase_ezequielzz/Model/todolist.dart';

class TodolistScreen extends StatefulWidget {
  final User user;
  const TodolistScreen({super.key, required this.user});

  @override
  State<TodolistScreen> createState() => _TodolistScreenState();
}

class _TodolistScreenState extends State<TodolistScreen> {
  final TodolistController _controller = TodolistController();
  final AuthFirebase _authFirebase = AuthFirebase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: const Color.fromARGB(255, 0, 0, 0)),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 50),
            Text(
              'Teste',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 166, 0),
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Firebase',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 0, 0),
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: const Color.fromARGB(255, 0, 0, 0)),
            onPressed: () {
              // Add your search functionality here
            },
          ),
          IconButton(
            icon: Icon(Icons.exit_to_app,
                color: const Color.fromARGB(255, 0, 0, 0)),
            onPressed: () {
              _authFirebase.signOut();
              Navigator.of(context).pushReplacementNamed('/home');
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Todolist>>(
        future: _controller.listar(widget.user.uid), // Chama a função de buscar todos os Todolist do usuário
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator()); // Exibe um indicador de carregamento
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}')); // Exibe uma mensagem de erro
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhuma tarefa encontrada.')); // Exibe uma mensagem quando não há tarefas
          } else {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].titulo), // Exibe o título da tarefa
                );
              },
            );
          }
        },
      ),
    );
  }
}

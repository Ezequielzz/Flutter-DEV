import 'package:flutter/material.dart';

class FilmeCadastroScreen extends StatefulWidget {
  const FilmeCadastroScreen({super.key});

  @override
  State<FilmeCadastroScreen> createState() => _FilmeCadastroScreenState();
}

class _FilmeCadastroScreenState extends State<FilmeCadastroScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _generoController = TextEditingController();
  final TextEditingController _sinopseController = TextEditingController();
  final TextEditingController _duracaoController = TextEditingController();
  final TextEditingController _anoController = TextEditingController();
  final TextEditingController _classificacaoController = TextEditingController();
  final TextEditingController _elencoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cadastre um Filme',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 72, 34, 160),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 50.00, left: 50.00, bottom: 40.00),
                  child: TextFormField(
                      decoration: InputDecoration(hintText: "Nome do Filme"),
                      controller: _nomeController,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Nome Inválido';
                        } else {
                          return null;
                        }
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 50.00, left: 50.00, bottom: 40.00),
                  child: TextFormField(
                      decoration: InputDecoration(hintText: "Gênero do Filme"),
                      controller: _generoController,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Gênero Inválido';
                        } else {
                          return null;
                        }
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 50.00, left: 50.00, bottom: 40.00),
                  child: TextFormField(
                      decoration: InputDecoration(hintText: "Sinopse do Filme"),
                      controller: _sinopseController,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Sinopse Inválida';
                        } else {
                          return null;
                        }
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 50.00, left: 50.00, bottom: 40.00),
                  child: TextFormField(
                      decoration: InputDecoration(hintText: "Duração do Filme"),
                      controller: _duracaoController,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Duração Inválida';
                        } else {
                          return null;
                        }
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 50.00, left: 50.00, bottom: 40.00),
                  child: TextFormField(
                      decoration: InputDecoration(hintText: "Ano do Filme"),
                      controller: _anoController,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Ano Inválido';
                        } else {
                          return null;
                        }
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 50.00, left: 50.00, bottom: 40.00),
                  child: TextFormField(
                      decoration: InputDecoration(hintText: "Classificação do Filme"),
                      controller: _classificacaoController,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Classificação Inválida';
                        } else {
                          return null;
                        }
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 50.00, left: 50.00, bottom: 40.00),
                  child: TextFormField(
                      decoration: InputDecoration(hintText: "Elenco do Filme"),
                      controller: _elencoController,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Elenco Inválido';
                        } else {
                          return null;
                        }
                      }),
                ),
                ElevatedButton(
                    onPressed: () => {
                          if (_formKey.currentState!.validate())
                            {_cadastrarFilme()}
                        },
                    child: Text('Cadastrar'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _cadastrarFilme() {
    // Método Cadastro de Filme no Json
    // Chamar Controller
  }
}

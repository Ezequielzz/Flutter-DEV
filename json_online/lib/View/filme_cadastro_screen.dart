import 'dart:io';

import 'package:flutter/material.dart';
import 'package:json_online/Controller/filmes_controller.dart';
import 'package:json_online/Model/filme_model.dart';

class FilmeCadastroScreen extends StatefulWidget {
  const FilmeCadastroScreen({super.key});

  @override
  State<FilmeCadastroScreen> createState() => _FilmeCadastroScreenState();
}

class _FilmeCadastroScreenState extends State<FilmeCadastroScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _generoController = TextEditingController();
  final TextEditingController _sinopseController = TextEditingController();
  final TextEditingController _duracaoController = TextEditingController();
  final TextEditingController _anoController = TextEditingController();
  final TextEditingController _classificacaoController =
      TextEditingController();
  final TextEditingController _elencoController = TextEditingController();

  FilmesController _controller = new FilmesController();

  @override
  void initState() {
    super.initState();
    _controller.loadFilmesfromJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Filme'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                      decoration:
                          const InputDecoration(hintText: "Nome do Filme"),
                      controller: _nomeController,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "Nome do Filme deve ser Preenchido";
                        } else {
                          return null;
                        }
                      }),
                  TextFormField(
                      decoration:
                          const InputDecoration(hintText: "Gênero do Filme"),
                      controller: _generoController,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "Gênero do Filme deve ser Preenchido";
                        } else {
                          return null;
                        }
                      }),
                  TextFormField(
                      decoration:
                          const InputDecoration(hintText: "Sinopse do Filme"),
                      controller: _sinopseController,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "Sinopse do Filme deve ser Preenchido";
                        } else {
                          return null;
                        }
                      }),
                  TextFormField(
                      decoration:
                          const InputDecoration(hintText: "Duração do Filme"),
                      controller: _duracaoController,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "Duração do Filme deve ser Preenchido";
                        } else {
                          return null;
                        }
                      }),
                  TextFormField(
                      decoration:
                          const InputDecoration(hintText: "Ano do Filme"),
                      controller: _anoController,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "Ano do Filme deve ser Preenchido";
                        } else {
                          return null;
                        }
                      }),
                  TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Classificação do Filme"),
                      controller: _classificacaoController,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "Classificação do Filme deve ser Preenchido";
                        } else {
                          return null;
                        }
                      }),
                  TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Elenco do Filme - Separe por vírgula"),
                      controller: _elencoController,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "Elenco do Filme deve ser Preenchido";
                        } else {
                          return null;
                        }
                      }),
                  SizedBox(
                    height: 12,
                  ),
                  ElevatedButton(
                    onPressed: () => {
                      if (_formkey.currentState!.validate()) {_cadastrarFilme()}
                    },
                    child: const Text("Cadastrar"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Filme getfilmes() {
    return Filme(
      nome: _nomeController.text,
      genero: _generoController.text,
      sinopse: _sinopseController.text,
      duracao: int.parse(_duracaoController.text),
      ano: int.parse(_anoController.text),
      classificacao: int.parse(_classificacaoController.text),
      elenco: _elencoController.text,
    );
  }

  void _cadastrarFilme() {
    //verificação
    _controller.addFilme(getfilmes());
    _controller.saveFilmestoJson();
    //snackbar "sucesso"
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Filme Cadastrado com Sucesso'),
        duration: Duration(seconds: 2),
      ),
    );
    _limpar();
  }

  void _limpar() {
    _nomeController.clear();
    _generoController.clear();
    _sinopseController.clear();
    _duracaoController.clear();
    _anoController.clear();
    _classificacaoController.clear();
    _elencoController.clear();
    setState(() {});
  }
}
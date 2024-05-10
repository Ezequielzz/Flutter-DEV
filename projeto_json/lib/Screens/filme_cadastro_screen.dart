import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_json/Controller/filme_controller.dart';
import 'package:projeto_json/Model/filme_model.dart';

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
  final TextEditingController _classificacaoController =
      TextEditingController();
  final TextEditingController _elencoController = TextEditingController();
  File? _imagemSelecionada;

  FilmeController _controller = FilmeController();

  @override
  void initState() {
    _controller.carregarJson();
  }

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
                  padding: const EdgeInsets.only(
                      right: 50.00, left: 50.00, bottom: 40.00),
                  child: TextFormField(
                      decoration: InputDecoration(hintText: "Nome do Filme"),
                      controller: _nomeController,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Nome Inválido!';
                        } else {
                          return null;
                        }
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      right: 50.00, left: 50.00, bottom: 40.00),
                  child: TextFormField(
                      decoration: InputDecoration(hintText: "Gênero do Filme"),
                      controller: _generoController,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Gênero Inválido!';
                        } else {
                          return null;
                        }
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      right: 50.00, left: 50.00, bottom: 40.00),
                  child: TextFormField(
                      decoration: InputDecoration(hintText: "Sinopse do Filme"),
                      controller: _sinopseController,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Sinopse Inválida!';
                        } else {
                          return null;
                        }
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      right: 50.00, left: 50.00, bottom: 40.00),
                  child: TextFormField(
                      decoration: InputDecoration(hintText: "Duração do Filme"),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      controller: _duracaoController,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Duração Inválida!';
                        } else {
                          return null;
                        }
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      right: 50.00, left: 50.00, bottom: 40.00),
                  child: TextFormField(
                      decoration: InputDecoration(hintText: "Ano do Filme"),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      controller: _anoController,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Ano Inválido!';
                        } else {
                          return null;
                        }
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      right: 50.00, left: 50.00, bottom: 40.00),
                  child: TextFormField(
                      decoration:
                          InputDecoration(hintText: "Classificação do Filme"),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      controller: _classificacaoController,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Classificação Inválida!';
                        } else {
                          return null;
                        }
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      right: 50.00, left: 50.00, bottom: 40.00),
                  child: TextFormField(
                      decoration: InputDecoration(hintText: "Elenco do Filme"),
                      controller: _elencoController,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Elenco Inválido!';
                        } else {
                          return null;
                        }
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      right: 50.00, left: 50.00, bottom: 40.00),
                  child: _imagemSelecionada != null
                      ? Image.file(
                          _imagemSelecionada!,
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        )
                      : SizedBox.shrink(),
                ),
                IconButton(onPressed: _tirarFoto, icon: Icon(Icons.camera_alt)),
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

  Future<void> _tirarFoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _imagemSelecionada = File(pickedFile.path);
      });
    }
  }

  Filme getFilme() {
    return Filme(
        nome: _nomeController.text,
        genero: _generoController.text,
        sinopse: _sinopseController.text,
        duracao: int.parse(_duracaoController.text),
        ano: int.parse(_anoController.text),
        classificacao: int.parse(_classificacaoController.text),
        elenco: _elencoController.text, // mudar para Text
        imagem: _imagemSelecionada!.path
        );
  }

  void _cadastrarFilme() {
    // Método Cadastro de Filme no Json
    
    _controller.addFilme(getFilme());
    _controller.salvarJson();

    // snackbar
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Filme Cadastrado!'),
      duration: Duration(seconds: 3),
    ));
    limpar();
  }

  void limpar() {
    _nomeController.clear();
    _generoController.clear();
    _sinopseController.clear();
    _duracaoController.clear();
    _anoController.clear();
    _classificacaoController.clear();
    _elencoController.clear();
    _imagemSelecionada = null;
  }
}

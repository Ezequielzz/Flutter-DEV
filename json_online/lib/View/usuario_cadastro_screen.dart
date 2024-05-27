import 'package:flutter/material.dart';
import 'package:json_online/Model/usuario_model.dart';
import '../Controller/usuario_controller.dart';

class UsuarioCadastroScreen extends StatefulWidget {
  const UsuarioCadastroScreen({super.key});

  @override
  State<UsuarioCadastroScreen> createState() => _UsuarioCadastroScreenState();
}

class _UsuarioCadastroScreenState extends State<UsuarioCadastroScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  UsuarioController _controller = UsuarioController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Usuario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            children: [
              SingleChildScrollView(
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(hintText: "ID do Usuario"),
                        controller: _idController,
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return "ID do usuario deve ser preenchido";
                          } else if (int.tryParse(value) == null) {
                            return "ID do usuario deve ser um número";
                          } else {
                            return null;
                          }
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(hintText: "Nome do Usuario"),
                        controller: _nomeController,
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return "Nome do usuario deve ser preenchido";
                          } else {
                            return null;
                          }
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(hintText: "Email do Usuario"),
                        controller: _emailController,
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return "Email do usuario deve ser preenchido";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            _cadastrarUsuario();
                          }
                        },
                        child: const Text("Cadastrar"),
                      ),
                    ],
                  ),
                ),
              ),
              FutureBuilder<List<Usuario>>(
                future: _controller.getAllUsuarios(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Erro: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('Nenhum usuário encontrado.'));
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(snapshot.data![index].nome),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Usuario getUsuario() {
    return Usuario(
      id: int.parse(_idController.text),
      nome: _nomeController.text,
      email: _emailController.text,
    );
  }

  void _cadastrarUsuario() async {
    try {
      await _controller.addUsuario(getUsuario());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Usuario cadastrado com sucesso'),
          duration: Duration(seconds: 2),
        ),
      );
      _limpar();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao cadastrar usuario: $e'),
          duration: Duration(seconds: 2),
        ),
      );
    }
    setState(() {});
  }

  void _limpar() {
    _idController.clear();
    _nomeController.clear();
    _emailController.clear();
  }
}

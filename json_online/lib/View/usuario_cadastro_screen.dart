import 'package:flutter/material.dart';
import 'package:json_online/Model/usuario_model.dart';
import '../Controller/usuario_controller.dart';

class UsuarioCadastroScreen extends StatefulWidget {
  const UsuarioCadastroScreen({super.key});

  @override
  State<UsuarioCadastroScreen> createState() => _UsuarioCadastroScreenState();
}

class _UsuarioCadastroScreenState extends State<UsuarioCadastroScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>(); // Chave global para o formulário
  final TextEditingController _idController = TextEditingController(); // Controlador para o campo de ID
  final TextEditingController _nomeController = TextEditingController(); // Controlador para o campo de nome
  final TextEditingController _emailController = TextEditingController(); // Controlador para o campo de email

  UsuarioController _controller = UsuarioController(); // Instância do controlador de usuário
  bool _isEditing = false; // Indica se está em modo de edição
  int? _editingUserId; // ID do usuário em edição

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Usuario'), // Título da AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            children: [
              Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(hintText: "ID do Usuario"),
                      controller: _idController,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "ID do usuario deve ser preenchido"; // Validação para campo vazio
                        } else if (int.tryParse(value) == null) {
                          return "ID do usuario deve ser um número"; // Validação para campo não numérico
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
                          return "Nome do usuario deve ser preenchido"; // Validação para campo vazio
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
                          return "Email do usuario deve ser preenchido"; // Validação para campo vazio
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
                          if (_isEditing) {
                            _atualizarUsuario(); // Chama a função de atualizar usuário
                          } else {
                            _cadastrarUsuario(); // Chama a função de cadastrar usuário
                          }
                        }
                      },
                      child: Text(_isEditing ? "Atualizar" : "Cadastrar"),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: FutureBuilder<List<Usuario>>(
                  future: _controller.getAllUsuarios(), // Chama a função de buscar todos os usuários
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator()); // Exibe um indicador de carregamento
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Erro: ${snapshot.error}')); // Exibe uma mensagem de erro
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('Nenhum usuário encontrado.')); // Exibe uma mensagem quando não há usuários
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(snapshot.data![index].nome), // Exibe o nome do usuário
                            subtitle: Text(snapshot.data![index].email), // Exibe o email do usuário
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () {
                                    _editarUsuario(snapshot.data![index]); // Chama a função de editar usuário
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    _deletarUsuario(snapshot.data![index].id); // Chama a função de deletar usuário
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
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
    ); // Retorna um objeto usuário com os dados preenchidos
  }

  void _cadastrarUsuario() async {
    try {
      await _controller.addUsuario(getUsuario()); // Adiciona um novo usuário
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Usuario cadastrado com sucesso'),
          duration: Duration(seconds: 2),
        ),
      );
      _limpar(); // Limpa os campos após o cadastro
      setState(() {}); // Atualiza a interface após cadastrar o usuário
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao cadastrar usuario: $e'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void _deletarUsuario(int id) async {
    try {
      await _controller.deleteUsuario(id); // Deleta o usuário
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Usuario deletado com sucesso'),
          duration: Duration(seconds: 2),
        ),
      );
      setState(() {}); // Atualiza a interface após deletar o usuário
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao deletar usuario: $e'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void _editarUsuario(Usuario usuario) {
    _idController.text = usuario.id.toString();
    _nomeController.text = usuario.nome;
    _emailController.text = usuario.email;
    _isEditing = true;
    _editingUserId = usuario.id;
  }

  void _atualizarUsuario() async {
    try {
      Usuario usuario = getUsuario();
      await _controller.updateUsuario(_editingUserId!, usuario); // Atualiza o usuário
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Usuario atualizado com sucesso'),
          duration: Duration(seconds: 2),
        ),
      );
      _limpar(); // Limpa os campos após a atualização
      setState(() {
        _isEditing = false; // Sai do modo de edição
        _editingUserId = null;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao atualizar usuario: $e'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void _limpar() {
    _idController.clear();
    _nomeController.clear();
    _emailController.clear();
    _isEditing = false;
    _editingUserId = null;
  }
}

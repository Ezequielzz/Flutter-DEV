
VIEW

import 'package:flutter/material.dart';
import 'package:myapp/DatabaseController.dart';

import 'Model.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final dbHelper = DatabaseHelper();
  final _formKey = GlobalKey<FormState>();

  // Controllers para os campos de texto
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Usuário'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira um nome';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextFormField(
                controller: _senhaController,
                decoration: InputDecoration(labelText: 'Senha'),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira uma senha';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _addUser();
                    }
                  },
                  child: Text('Cadastrar'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Método para adicionar um novo usuário ao banco de dados
  void _addUser() {
    final newUser = Usuario(
      id: 0, // Pode ser qualquer valor, já que é autoincrementado
      name: _nomeController.text,
      email: _emailController.text,
      password: _senhaController.text,
    );

    dbHelper.createUser(newUser).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Usuário cadastrado com sucesso'),
        ),
      );

      // Limpa os campos após o cadastro
      _nomeController.clear();
      _emailController.clear();
      _senhaController.clear();

      // Navega para a tela de login após o cadastro bem-sucedido
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao cadastrar o usuário: $error'),
        ),
      );
    });
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final dbHelper = DatabaseHelper();
  final _formKey = GlobalKey<FormState>();

  // Controllers para os campos de texto
  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextFormField(
                controller: _senhaController,
                decoration: InputDecoration(labelText: 'Senha'),
                obscureText: true,
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  _login();
                },
                child: Text('Entrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Método para verificar as credenciais e fazer login
  void _login() {
    final email = _emailController.text;
    final senha = _senhaController.text;

    dbHelper.getUsers().then((users) {
      final user = users.firstWhere(
        (user) => user.email == email && user.password == senha,
        orElse: () => Usuario(id: -1, name: '', email: '', password: ''),
      );

      if (user.id != -1) {
        // Login bem-sucedido, navega para a página principal
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        // Login falhou, exibe uma mensagem de erro e imprime no terminal
        print('Credenciais inválidas: Email: $email, Senha: $senha');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Credenciais inválidas. Por favor, tente novamente.'),
          ),
        );
      }
    }).catchError((error) {
      print('Erro ao buscar usuários do banco de dados: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao buscar usuários. Por favor, tente novamente.'),
        ),
      );
    });
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página Principal'),
      ),
      body: Center(
        child: Text('Bem-vindo à página principal!'),
      ),
    );
  }
}

-----------------------

MAIN

import 'package:flutter/material.dart';
import 'package:myapp/View.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Persistência de Dados SQLite",
      theme: ThemeData(primaryColor: Color.fromARGB(255, 0, 255, 255)),
      home: CadastroPage(),
    );
  }
}

---------------------

MODEL

class Usuario {
  int id;
  String name;
  String email;
  String password;

  Usuario({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
    };
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
    );
  }
}

----------------------

DATABASECONTROLLER

import 'package:myapp/Model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const String DATABASE_NAME = 'usuario.db'; // Nome do banco de dados
  static const String TABLE_NAME = 'usuarios'; // Nome da tabela
  static const String CREATE_USERS_TABLE_SCRIPT =
      "CREATE TABLE usuarios(id INTEGER PRIMARY KEY," +
      "name TEXT, email TEXT, password TEXT)";

  Future<Database> _getDatabase() async {
    return openDatabase(
      join(
        await getDatabasesPath(),
        DATABASE_NAME,
      ), // Caminho do banco de dados
      onCreate: (db, version) {
        return db.execute(
            CREATE_USERS_TABLE_SCRIPT); // Executa o script de criação da tabela quando o banco é criado
      },
      version: 1,
    );
  }

  // Método para criar um novo usuário no banco de dados
  Future<void> createUser(Usuario user) async {
    try {
      final Database db = await _getDatabase();
      await db.insert(
          TABLE_NAME, user.toMap()); // Insere o usuário no banco de dados
    } catch (ex) {
      print(ex);
      return;
    }
  }

  // Método para obter todos os usuários do banco de dados
  Future<List<Usuario>> getUsers() async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps =
          await db.query(TABLE_NAME); // Consulta todos os usuários na tabela

      return List.generate(
        maps.length,
        (i) {
          return Usuario.fromMap(maps[
              i]); // Converte os resultados da consulta para objetos Usuario
        },
      );
    } catch (ex) {
      print(ex);
      return [];
    }
  }
}

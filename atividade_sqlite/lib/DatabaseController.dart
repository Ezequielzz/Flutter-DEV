import 'package:atividade_sqlite/Model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class BancoDadosCrud {
  // Atributos
  static const String DB_NOME = 'usuarios.db'; // Nome do banco de dados
  static const String TABLE_NOME = 'usuarios'; // Nome da tabela
  static const String
      CREATE_USUARIOS_TABLE_SCRIPT = // Script SQL para criar a tabela
      "CREATE TABLE IF NOT EXISTS usuarios(email TEXT PRIMARY KEY," +
          "name TEXT, password TEXT)";

  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), DB_NOME), // Caminho do banco de dados
      onCreate: (db, version) {
        return db.execute(
            CREATE_USUARIOS_TABLE_SCRIPT); // Executa o script de criação da tabela quando o banco é criado
      },
      version: 1,
    );
  }

  // Método para criar um novo usuário no banco de dados
  Future<void> create(Usuario user) async {
    try {
      final Database db = await _getDatabase();
      await db.insert(
          TABLE_NOME, user.toMap()); // Insere o usuário no banco de dados
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
          await db.query(TABLE_NOME); // Consulta todos os usuários na tabela

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

  // Método para atualizar um usuário no banco de dados
  Future<void> update(Usuario user) async {
    try {
      final Database db = await _getDatabase();
      await db.update(
        TABLE_NOME,
        user.toMap(),
        where: "email = ?", // Condição para atualizar o usuário com base no ID
        whereArgs: [user.email],
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }

  Future<void> cadastrarUsuario(
      String name, String email, String password) async {
    try {
      final Database db = await _getDatabase();
      await db.insert(
        TABLE_NOME,
        {
          'name': name,
          'email': email,
          'password': password,
        },
      );
      print('Usuário cadastrado com sucesso!');
    } catch (ex) {
      print('Erro ao cadastrar usuário: $ex');
    }
  }

  Future<bool> realizarLogin(String email, String password) async {
  try {
    final Database db = await _getDatabase();
    final List<Map<String, dynamic>> result = await db.query(
      TABLE_NOME,
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    return result.isNotEmpty; // Retorna true se encontrou um usuário com as credenciais fornecidas
  } catch (ex) {
    print('Erro ao realizar login: $ex');
    return false; // Retorna false se ocorreu um erro durante o processo de login
  }
}
}

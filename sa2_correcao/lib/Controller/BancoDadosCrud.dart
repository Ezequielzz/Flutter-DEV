import 'package:path/path.dart';
import 'package:sa2_correcao/Model/Usuario.dart';
import 'package:sqflite/sqflite.dart';

class BancoDadosCrud {
  static const String Nome_BD = 'usuarios.db'; // Nome do banco de dados
  static const String Nome_tabela = 'usuarios'; // Nome da tabela
  static const String Script_Criar_Tabela = // Script SQL para criar a tabela
      "CREATE TABLE usuarios(id SERIAL PRIMARY KEY," +
          "nome TEXT, email TEXT UNIQUE, senha TEXT)";

  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), Nome_BD), // Caminho do banco de dados
      onCreate: (db, version) {
        return db.execute(
            Script_Criar_Tabela); // Executa o script de criação da tabela quando o banco é criado
      },
      version: 1,
    );
  }

  // Método para criar um novo usuario no banco de dados
  Future<void> create(Usuario usuario) async {
    try {
      final Database db = await _getDatabase();
      await db.insert(
          Nome_tabela, usuario.toMap()); // Insere o usuario no banco de dados
    } catch (ex) {
      print(ex);
      return;
    }
  }

  // Método para obter os dados do usuario do banco de dados
  Future<Usuario?> getUsuario(String email, String senha) async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps =
       await db.query(Nome_tabela,
        where: 'email = ? AND senha = ?', 
        whereArgs: [email,senha]); // Consulta todos os usuarios na tabela

      if (maps.isNotEmpty) {
        return Usuario.fromMap(maps[0]);
      } else {
        return null;
      }
    } catch (ex) {
      print(ex);
      return null;
    }
  }

  // Método para obter o usuario do banco de dados utilizando boolean
  Future<bool> existsUsuario(String email, String senha) async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps =
       await db.query(Nome_tabela,
        where: 'email = ? AND senha = ?', 
        whereArgs: [email,senha]); // Consulta todos os usuarios na tabela

      if (maps.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (ex) {
      print(ex);
      return false;
    }
  }

  // Método para atualizar um usuario no banco de dados
  Future<void> update(Usuario usuario) async {
    try {
      final Database db = await _getDatabase();
      await db.update(
        Nome_tabela,
        usuario.toMap(),
        where: "id = ?", // Condição para atualizar o usuario com base no ID
        whereArgs: [usuario.id],
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }

  // Método para excluir um usuario do banco de dados
  Future<void> delete(int id) async {
    try {
      final Database db = await _getDatabase();
      await db.delete(
        Nome_tabela,
        where: "id = ?", // Condição para excluir o usuario com base no ID
        whereArgs: [id],
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }
}

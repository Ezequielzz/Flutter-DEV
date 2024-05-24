import 'package:path/path.dart';
import 'package:projeto_api_clima_loc/Model/cidade_db_model.dart';
import 'package:sqflite/sqflite.dart';

class CidadeDbService {
  // Atributos de detalhes do Banco de Dados
  static const String DB_NOME = 'cidade.db'; // Nome do banco de dados
  static const String TABLE_NOME = 'cidades'; // Nome da tabela
  static const String
      CREATE_CIDADES_TABLE_SCRIPT = // Script SQL para criar a tabela
      "CREATE TABLE IF NOT EXISTS (id SERIAL," +
          "nomecidade UNIQUE TEXT, favoritos BIT)";

  // GetDatabase
  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), DB_NOME), // Caminho do banco de dados
      onCreate: (db, version) {
        return db.execute(
            CREATE_CIDADES_TABLE_SCRIPT); // Executa o script de criação da tabela quando o banco é criado
      },
      version: 1,
    );
  }

  // Método para criar um nova cidade no banco de dados
  Future<void> createCidade(CidadeDb model) async {
    try {
      final Database db = await _getDatabase();
      await db.insert(
          TABLE_NOME, model.toMap()); // Insere a cidade no banco de dados
    } catch (ex) {
      print(ex);
      return;
    }
  }

  // Método para obter todas as cidades do banco de dados
  Future<List<Map<String, dynamic>>> getCidades() async {
    Database db = await _getDatabase();
    List<Map<String, dynamic>> result = await db.query(TABLE_NOME);
    db.close();
    return result;
  }

  // Método para inserir cidades no banco de dados
  Future<void> insertCidade(CidadeDb cidade) async {
    Database db = await _getDatabase();
    await db.insert(TABLE_NOME, cidade.toMap());
    db.close();
  }

  //updatecidade
  Future<void> updateCidade(CidadeDb cidade) async {
    Database db = await _getDatabase();
    await db.update(TABLE_NOME, cidade.toMap(),
        where: 'nomecidade =?', whereArgs: [cidade.nomeCidade]);
    db.close();
  }

  //deleteCity
  Future<void> deleteCidade(CidadeDb cidade) async {
    Database db = await _getDatabase();
    await db.delete(TABLE_NOME,
        where: 'nomecidade =?', whereArgs: [cidade.nomeCidade]);
    db.close();
  }
}

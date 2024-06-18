import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_online/Model/usuario_model.dart';

class UsuarioService {
  final String baseUrl =
      "http://192.168.56.1:3000/usuarios"; // URL base do serviço

  Future<Map<String, dynamic>> getFromUsuarioService(String id) async {
    final url = Uri.parse(baseUrl); // Constrói a URL do serviço
    final response = await http.get(url); // Faz uma requisição HTTP GET
    if (response.statusCode == 200) {
      return jsonDecode(response.body); // Decodifica a resposta JSON
    } else {
      throw Exception(
          'Falha ao carregar o json...'); // Lança uma exceção em caso de erro
    }
  }

  Future<List<Usuario>> getAllService() async {
    final response =
        await http.get(Uri.parse(baseUrl)); // Faz uma requisição HTTP GET

    if (response.statusCode != 200) {
      throw Exception(
          'Falha ao carregar a lista de usuários...'); // Lança uma exceção em caso de erro
    }

    List<dynamic> dynamicList =
        jsonDecode(response.body); // Decodifica a resposta JSON
    return dynamicList
        .map((json) => Usuario.fromJson(json))
        .toList(); // Converte a lista de JSON para uma lista de objetos Usuario
  }

  Future<void> postToUsuarioService(Map<String, dynamic> usuario) async {
    final url = Uri.parse('$baseUrl'); // Constrói a URL do serviço
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(usuario), // Codifica os dados do usuário para JSON
    );
    if (response.statusCode != 201) {
      throw Exception(
          'Falha ao enviar o json...'); // Lança uma exceção em caso de erro
    }
  }

  Future<void> deleteUsuario(String id) async {
    final url = Uri.parse(
        '$baseUrl/$id'); // URL completa para deletar o usuário com o ID especificado
    final response = await http.delete(url); // Requisição HTTP DELETE

    if (response.statusCode != 200) {
      throw Exception(
          'Falha ao deletar usuário...'); // Lança uma exceção em caso de erro
    }
  }

  Future<void> updateUsuario(String id, Map<String, dynamic> usuario) async {
    final url = Uri.parse(
        '$baseUrl/$id'); // URL completa para atualizar o usuário com o ID especificado
    final response = await http.put(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(
          usuario), // Corpo da requisição contendo os novos dados do usuário
    );

    if (response.statusCode != 200) {
      throw Exception(
          'Falha ao atualizar usuário...'); // Lança uma exceção em caso de erro
    }
  }
}
    if (response.statusCode != 200) {
      throw Exception('Falha ao atualizar usuário...');
    }
  }
}

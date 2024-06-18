import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_online/Model/usuario_model.dart';

class UsuarioService {
  final String baseUrl = "http://192.168.56.1:3000/usuarios";

  Future<Map<String, dynamic>> getFromUsuarioService(String id) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Falha ao carregar o json...');
    }
  }

  Future<List<Usuario>> getAllService() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode != 200) {
      throw Exception('Falha ao carregar a lista de usuários...');
    }
    List<dynamic> dynamicList = jsonDecode(response.body);
    return dynamicList.map((json) => Usuario.fromJson(json)).toList();
  }

  Future<void> postToUsuarioService(Map<String, dynamic> usuario) async {
    final url = Uri.parse(baseUrl);
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(usuario),
    );
    if (response.statusCode != 201) {
      throw Exception('Falha ao enviar o json...');
    }
  }

  Future<void> deleteUsuario(String id) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.delete(url);
    if (response.statusCode != 200) {
      throw Exception('Falha ao deletar usuário...');
    }
  }

  Future<void> updateUsuario(String id, Map<String, dynamic> usuario) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.put(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(usuario),
    );
    if (response.statusCode != 200) {
      throw Exception('Falha ao atualizar usuário...');
    }
  }
}

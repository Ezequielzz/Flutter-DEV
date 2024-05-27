import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:json_online/Model/usuario_model.dart';

class UsuarioService {
  final String baseUrl = "http://10.109.207.143:3000/usuarios";

  Future<Map<String, dynamic>> getFromUsuarioService(String id) async {
    final url = Uri.parse(baseUrl);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Falha ao carregar o json...');
    }
  }

  Future<List<Usuario>> getAllService() async {
    final response = await http.get(Uri.parse(baseUrl));

    if(response.statusCode != 200){
      throw Exception();
    }

    List<Usuario> list = [];
    List<dynamic> dynamicList = jsonDecode(response.body);

    for(var jsonMap in dynamicList){
      list.add(Usuario.fromJson(jsonMap));
    }
    return list;
  }

   Future<void> postToUsuarioService(Map<String, dynamic> usuario) async {
    final url = Uri.parse('$baseUrl');
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(usuario),
    );
    if (response.statusCode != 201) { // 201 Created is the expected response
      throw Exception('Falha ao enviar o json...');
    }
  }
}
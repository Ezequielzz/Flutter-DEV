import 'package:json_online/Service/usuario.service.dart';
import 'package:json_online/Model/usuario_model.dart';

class UsuarioController {
  List<Usuario> listUsuario = [];
  UsuarioService _service = UsuarioService(); // Instância do serviço de usuário

  Future<void> getUsuario(int id) async {
    Usuario usuario = Usuario.fromJson(await _service.getFromUsuarioService(id.toString())); // Busca um usuário pelo ID e converte para um objeto Usuario
    listUsuario.add(usuario); // Adiciona o usuário à lista
  }

  Future<List<Usuario>> getAllUsuarios() async {
    listUsuario = await _service.getAllService(); // Busca todos os usuários
    return listUsuario; // Retorna a lista de usuários
  }

  Future<void> addUsuario(Usuario usuario) async {
    await _service.postToUsuarioService(usuario.toJson()); // Adiciona um novo usuário
    listUsuario.add(usuario); // Adiciona o usuário à lista local
  }

  Future<void> deleteUsuario(int id) async {
    await _service.deleteUsuario(id.toString()); // Deleta o usuário no serviço
    listUsuario.removeWhere((usuario) => usuario.id == id); // Remove o usuário da lista local
  }

  Future<void> updateUsuario(int id, Usuario usuario) async {
    await _service.updateUsuario(id.toString(), usuario.toJson()); // Atualiza o usuário no serviço
    int index = listUsuario.indexWhere((u) => u.id == id); // Encontra o índice do usuário na lista
    if (index != -1) {
      listUsuario[index] = usuario; // Atualiza o usuário na lista local
    }
  }
}
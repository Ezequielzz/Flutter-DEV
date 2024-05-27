import 'package:json_online/Service/usuario.service.dart';
import 'package:json_online/Model/usuario_model.dart';

class UsuarioController {
  List<Usuario> listUsuario = [];
  UsuarioService _service = UsuarioService();

  Future<void> getUsuario(int id) async {
    Usuario usuario = Usuario.fromJson(await _service.getFromUsuarioService(id.toString()));
    listUsuario.add(usuario);
  }

  Future<List<Usuario>> getAllUsuarios() async {
    listUsuario = await _service.getAllService();
    return listUsuario;
  }

  Future<void> addUsuario(Usuario usuario) async {
    await _service.postToUsuarioService(usuario.toJson());
    listUsuario.add(usuario);
  }
}

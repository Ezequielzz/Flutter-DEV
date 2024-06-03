class Usuario {
  final int id; // Atributo ID
  final String nome; // Atributo Nome
  final String email; // Atributo Email

  Usuario({required this.id, required this.nome, required this.email}); // Construtor

  Map<String, dynamic> toJson() {
    return {'id': id, 'nome': nome, 'email': email}; // Converte o objeto para um mapa JSON
  }

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['id'] is int ? json['id'] : int.parse(json['id']), // Converte o ID para inteiro se necessário
      nome: json['nome'], 
      email: json['email']
    );
  }
}

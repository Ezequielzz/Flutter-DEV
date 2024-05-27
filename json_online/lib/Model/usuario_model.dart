class Usuario {
  //Atributos
  final int id;
  final String nome;
  final String email;

  Usuario({required this.id, required this.nome, required this.email});

  Map<String, dynamic> toJson() {
    return {'id': id, 'nome': nome, 'email': email};
  }

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(id: json['id'], nome: json['nome'], email: json['email']);
  }
}

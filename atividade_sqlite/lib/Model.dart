class Usuario {
  String name;
  String email;
  String password;

  Usuario({
    required this.name,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      name: map['name'],
      email: map['email'],
      password: map['password'],
    );
  }
}
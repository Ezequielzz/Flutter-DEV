class Produto {
  //atrbutos
  final int id;
  final String nome;
  final double preco;

  Produto({required this.id, required this.nome, required this.preco});

  //TO JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id, 
      'nome': nome,
      'preco': preco,
    };
  }
  //FROM JSON
  factory Produto.fromJson(Map<String, dynamic> json) {
  return Produto(
    id: json['id'] is String ? int.parse(json['id']) : json['id'], // Verifica se 'id' é uma string antes de converter
    nome: json['nome'],
    preco: json['preco'] is double ? json['preco'] : double.parse(json['preco'].toString()), // Converta para string primeiro, pois já é esperado ser um double
  );
}


}

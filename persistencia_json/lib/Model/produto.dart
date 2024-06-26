class Produto {
  //atributos
  final String nome;
  final double preco;
  final String categoria;
  //Construtor
  Produto({
    required this.nome,
    required this.preco,
    required this.categoria,
  });

  Map<String, dynamic> toJson() => {
        'nome': nome,
        'preco': preco,
        'categoria': categoria,
      };

  factory Produto.fromJson(Map<String, dynamic> map) {
    return Produto(
      nome: map['nome'],
      preco: map['preco'],
      categoria: map['categoria'],
    );
  }
}

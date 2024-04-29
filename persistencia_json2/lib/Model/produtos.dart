class Produto {
  // Atributos
  final String nome;
  final double preco;
  final String categoria;
  final String imagem;

  // Construtor
const Produto ({
  required this.nome,
  required this.preco,
  required this.categoria,
  required this.imagem,
});
  // Métodos
  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'preco': preco,
      'categoria': categoria,
      'imagem': imagem,
    };
  }

  factory Produto.fromJson(Map<String,dynamic> json) {
    return Produto(
    nome: json['nome'],
    preco: json['preco'],
    categoria: json['categoria'],
    imagem: json['imagem']
    );
  }
}
class Filme {
  // Filme
  //     - Nome - String
  //     - Gênero/Categoria - String
  //     - Sinopse - String
  //     - Duração - Int
  //     - Ano - Int
  //     - Classificação - Int
  //     - Elenco - <String>
  //     - Imagem - String

  // Atributos
  final String nome;
  final String genero;
  final String sinopse;
  final int duracao;
  final int ano;
  final int classificacao;
  final String elenco; // Trocar para string
  final String imagem;

  Filme({
    required this.nome,
    required this.genero,
    required this.sinopse,
    required this.duracao,
    required this.ano,
    required this.classificacao,
    required this.elenco,
    required this.imagem,
  });

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'genero': genero,
      'sinopse': sinopse,
      'duracao': duracao,
      'ano': ano,
      'classificacao': classificacao,
      'elenco': elenco,
      'imagem': imagem,
    };
  }

  factory Filme.fromJson(Map<String, dynamic> json) {
    return Filme(
        nome: json['nome'],
        genero: json['genero'],
        sinopse: json['sinopse'],
        duracao: json['duracao'],
        ano: json['ano'],
        classificacao: json['classificacao'],
        elenco: json['elenco'],
        imagem: json['imagem']);
  }
}

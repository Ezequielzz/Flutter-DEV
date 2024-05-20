class Filme {
  //Atributos
  final String nome;
  final String genero;
  final String sinopse;
  final int duracao;
  final int ano;
  final int classificacao;
  final String elenco;

  Filme(
      {required this.nome,
      required this.genero,
      required this.sinopse,
      required this.duracao,
      required this.ano,
      required this.classificacao,
      required this.elenco
      });

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'genero': genero,
      'sinopse': sinopse,
      'duracao': duracao,
      'ano': ano,
      'classificacao': classificacao,
      'elenco': elenco
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
      elenco: json['elenco']
    );
  }
}

class CidadeDb {
  // Atributos
  int? id;
  final String nomeCidade;
  final int favorito;

  CidadeDb({this.id, required this.nomeCidade, required this.favorito});

  // Métodos
  Map<String, dynamic> toMap() {
    return {'nomecidade': this.nomeCidade, 'favorito': this.favorito};
  }

  factory CidadeDb.fromMap(Map<String, dynamic> map) {
    return CidadeDb(
        id: map['id'],
        nomeCidade: map['nomecidade'],
        favorito: map['favorito']);
  }
}

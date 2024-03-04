class Animal {
  // Atributos
  String _especie;
  String _urlFoto;
  String _urlAudio;

   // Métodos
   // Construtor
   Animal(this._especie, this._urlFoto, this._urlAudio);

   String get especie => _especie;
   String get urlFoto => _urlFoto;
   String get urlAudio => _urlAudio;

  set especie(String especie){
    this._especie = especie;
  }

  set urlFoto(String urlFoto){
    this._urlFoto = urlFoto;
  }

  set urlAudio(String urlAudio){
    this._urlAudio = urlAudio;
  }
}
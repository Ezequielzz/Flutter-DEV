import 'package:app_carro/CarroModel.dart';

class CarroController {
  List<Carro> _carroList = [
    Carro("Fiat Uno", 1992, ""),
    Carro("Classic", 2005, "")
  ];

  // Métodos

  // Puxar lista de um carros de carrosList
  List<Carro> get listarCarros => _carroList;

  void adicionarCarro(String modelo, int ano, String imagemUrl) {
    // Instaciando um Objeto
    Carro carro = Carro(modelo, ano, imagemUrl);
    _carroList.add(carro);
  }
}
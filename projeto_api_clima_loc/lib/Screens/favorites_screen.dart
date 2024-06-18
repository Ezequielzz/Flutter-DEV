import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  TextEditingController _cityController = TextEditingController();
  final WeatherController _controller = WeatherController();
  final CidadeDbController _dbController = CidadeDbController();
  late List<CidadeDb> _favoritedCidades; // Lista das cidades favoritas

  @override
  void initState() {
    super.initState();
    _favoritedCidades = []; // Inicializa a lista vazia para evitar erros de inicialização tardia
    _loadFavoritedCidades(); // Carrega as cidades favoritas ao iniciar a tela
  }

  Future<void> _loadFavoritedCidades() async {
    // Carrega as cidades favoritas do banco de dados
    List<CidadeDb> favoritedCidades = await _dbController.getFavoritedCidades();
    setState(() {
      _favoritedCidades = favoritedCidades; // Atualiza o estado com as cidades favoritas obtidas
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cidades Favoritas'),
      ),
      body: ListView.builder(
        itemCount: _favoritedCidades.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              // Ação ao clicar em uma cidade favorita (navegar para detalhes, por exemplo)
            },
            title: Text(_favoritedCidades[index].nomeCidade), // Nome da cidade favorita
            // Pode adicionar outros detalhes da cidade aqui, se necessário
          );
        },
      ),
    );
  }

  Future<void> _buscarCidade(String city) async {
    // Método para buscar uma cidade
    if (await _controller.buscarCidade(city)) {
      // Se a cidade for válida e encontrada
      CidadeDb db = CidadeDb(nomeCidade: city, favorito: 0); // Cria um objeto CidadeDb
      _dbController.create(db); // Salva a cidade no banco de dados
      // Snackbar para informar que a cidade foi encontrada
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Cidade encontrada!'), duration: Duration(seconds: 2)));
      // Redireciona para a tela de detalhes da cidade
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CityDetailsScreen(city: city)));
      setState(() {
        _dbController.getCidades().clear(); // Limpa a lista de cidades (possivelmente um ajuste necessário)
      });
    } else {
      _cityController.clear(); // Limpa o campo de texto
      // Snackbar para informar que a cidade não é válida
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Cidade inválida!'), duration: Duration(seconds: 2)));
      setState(() {});
    }
  }
}

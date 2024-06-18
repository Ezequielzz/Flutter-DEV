import 'package:flutter/material.dart';
import 'package:projeto_api_clima_loc/Controller/cidade_db_controller.dart';
import 'package:projeto_api_clima_loc/Controller/weather_controller.dart';
import 'package:projeto_api_clima_loc/Model/cidade_db_model.dart';

class CityDetailsScreen extends StatefulWidget {
  final String city;
  CityDetailsScreen({required this.city}); // Construtor para receber o nome da cidade

  @override
  State<CityDetailsScreen> createState() => _CityDetailsScreenState();
}

class _CityDetailsScreenState extends State<CityDetailsScreen> {
  final WeatherController _controller = WeatherController();
  final CidadeDbController _dbController = CidadeDbController();
  CidadeDb? cidadeDb; // Objeto que representa a cidade no banco de dados
  bool _isFavorited = false; // Estado de favorito da cidade
  double _tempAtual = 0.0; // Temperatura atual da cidade

  @override
  void initState() {
    super.initState();
    _loadWeather(); // Carrega os dados do clima da cidade
    _loadFavoriteState(); // Carrega o estado de favorito da cidade
  }

  Future<void> _loadWeather() async {
    await _controller.getWeather(widget.city); // Obtém os dados de clima da cidade
    if (_controller.listWeather.isNotEmpty) {
      setState(() {
        _tempAtual = _controller.listWeather.last.temp - 273; // Atualiza a temperatura atual
      });
    }
  }

  Future<void> _loadFavoriteState() async {
    // Carrega o estado de favorito da cidade do banco de dados
    cidadeDb = await _dbController.getCidade(widget.city);
    if (cidadeDb != null) {
      setState(() {
        _isFavorited = cidadeDb!.favorito == 1; // Define o estado de favorito com base no banco de dados
      });
    } else {
      // Se a cidade não estiver no banco de dados, cria uma nova entrada
      cidadeDb = CidadeDb(nomeCidade: widget.city, favorito: 0);
      await _dbController.create(cidadeDb!);
      setState(() {
        _isFavorited = false; // Define como não favoritado por padrão
      });
    }
  }

  Color _getAppBarColor(double temp) {
    // Define a cor da appbar com base na temperatura
    if (temp > 27) {
      return Colors.red;
    } else if (temp > 15) {
      return Colors.orange;
    } else {
      return Colors.blue;
    }
  }

  Future<void> _toggleFavorite() async {
    // Alterna o estado de favorito da cidade
    if (cidadeDb != null) {
      setState(() {
        _isFavorited = !_isFavorited; // Inverte o estado de favorito
      });
      cidadeDb!.favorito = _isFavorited ? 1 : 0; // Atualiza o valor de favorito no objeto da cidade
      await _dbController.update(cidadeDb!); // Atualiza o estado de favorito no banco de dados
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Previsão do Tempo',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: _getAppBarColor(_tempAtual), // Cor da AppBar baseada na temperatura atual
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: FutureBuilder(
            future: _controller.getWeather(widget.city), // Obtém os dados de clima da cidade
            builder: (context, snapshot) {
              if (_controller.listWeather.isEmpty) {
                return const CircularProgressIndicator(
                    color: Color.fromARGB(255, 0, 225, 255)); // Mostra um indicador de progresso enquanto carrega
              } else {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(_controller.listWeather.last.city), // Nome da cidade
                        IconButton(
                          onPressed: _toggleFavorite, // Alterna o estado de favorito ao pressionar
                          icon: _isFavorited
                              ? const Icon(Icons.star) // Ícone de estrela preenchida se favorito
                              : const Icon(Icons.star_border_outlined), // Ícone de estrela contornada se não favorito
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(_controller.listWeather.last.description), // Descrição do clima
                    const SizedBox(
                      height: 12,
                    ),
                    Text((_controller.listWeather.last.temp - 273)
                            .toStringAsFixed(0) +
                        '°'), // Temperatura atual formatada
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

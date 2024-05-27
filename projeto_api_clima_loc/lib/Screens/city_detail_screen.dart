import 'package:flutter/material.dart';
import 'package:projeto_api_clima_loc/Controller/cidade_db_controller.dart';
import 'package:projeto_api_clima_loc/Controller/weather_controller.dart';
import 'package:projeto_api_clima_loc/Model/cidade_db_model.dart';

class CityDetailsScreen extends StatefulWidget {
  final String city;
  CityDetailsScreen({required this.city});

  @override
  State<CityDetailsScreen> createState() => _CityDetailsScreenState();
}

class _CityDetailsScreenState extends State<CityDetailsScreen> {
  final WeatherController _controller = WeatherController();
  final CidadeDbController _dbController = CidadeDbController();
  late CidadeDb cidadeDb;
  bool _isFavorited = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> favoriteState(String city) async {
    cidadeDb = (await _dbController.getCidade(widget.city))!;
    if (cidadeDb.favorito == 0) {
      _isFavorited = false;
    } else {
      _isFavorited = true;
    }
    setState(() {});
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
        backgroundColor: Color.fromARGB(255, 0, 225, 255),
        foregroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Center(
          child: FutureBuilder(
            future: _controller.getWeather(widget.city),
            builder: (context, snapshot) {
              if (_controller.listWeather.isEmpty) {
                return CircularProgressIndicator(
                    color: Color.fromARGB(255, 0, 225, 255));
              } else {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(_controller.listWeather.last.city),
                        IconButton(
                          onPressed: () {
                            // Criar função para favoritar
                            setState(() {
                              _isFavorited = !_isFavorited;
                            });
                            if (_isFavorited == true) {
                              cidadeDb.favorito = 1;

                              _dbController.update(cidadeDb);
                            } else {
                              cidadeDb.favorito = 0;
                              _dbController.update(cidadeDb);
                            }
                          },
                          icon: _isFavorited
                              ? Icon(Icons.star)
                              : Icon(Icons.star_border_outlined),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(_controller.listWeather.last.description),
                    SizedBox(
                      height: 12,
                    ),
                    Text((_controller.listWeather.last.temp - 273)
                            .toStringAsFixed(0) +
                        '°'),
                    SizedBox(
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

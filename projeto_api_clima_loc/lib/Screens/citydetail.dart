import 'package:flutter/material.dart';
import 'package:projeto_api_clima_loc/Controller/weather_controller.dart';

class CityDetailsScreen extends StatefulWidget {
  final String city;
  CityDetailsScreen({required this.city});

  @override
  State<CityDetailsScreen> createState() => _CityDetailsScreenState();
}

class _CityDetailsScreenState extends State<CityDetailsScreen> {
  final WeatherController _controller = WeatherController();
  bool _isFavorited = false;

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

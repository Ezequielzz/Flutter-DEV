import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../Controller/weather_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //
  WeatherController _controller = new WeatherController();

  @override
  void initState() {
    super.initState();
    _getWeather();
  }

  Future<void> _getWeather() async {
    try {
      //geoLocator
      Position _locator = await Geolocator.getCurrentPosition();
      print(_locator.latitude);
      _controller.getWeatherLocation(
          _locator.latitude, _locator.longitude);
      setState(() {});
    } catch (e) {
      print(e);
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
        backgroundColor: Color.fromARGB(255, 0, 225, 255),
        foregroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: Center(
          child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  Navigator.pushNamed(context, '/search');
                },
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/favorites');
                },
                icon: Icon(Icons.star),
              ),
            ],
          ),
          SizedBox(height: 12),
          _controller.listWeather.isEmpty
              ? Column(
                  children: [
                    CircularProgressIndicator(color: Color.fromARGB(255, 0, 225, 255)),
                    IconButton(
                      icon: const Icon(Icons.refresh),
                      onPressed: () {
                        _getWeather();
                      },
                    )
                  ],
                )
              : Column(children: [
                  Text(_controller.listWeather.last.city),
                  Text(_controller.listWeather.last.description),
                  Text('Temperatura atual: ' + (_controller.listWeather.last.temp - 273).toStringAsFixed(0) + '°'),
                  Text('Temperatura mínima: ' + (_controller.listWeather.last.tempMin - 273).toStringAsFixed(0) + '°'),
                  Text('Temperatura máxima: ' +(_controller.listWeather.last.tempMax - 273).toStringAsFixed(0) + '°'),
                  IconButton(
                    icon: const Icon(Icons.refresh),
                    onPressed: () {
                      _getWeather();
                    },
                  )
                ])
        ],
      )),
    );
  }
}

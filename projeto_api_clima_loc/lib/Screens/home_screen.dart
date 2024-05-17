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
      print(_locator.longitude);
      _controller.getFromWeatherServiceLocation(
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
        backgroundColor: Color.fromARGB(255, 251, 255, 0),
        foregroundColor: Colors.white,
      ),
      body: Center(
          child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/search');
                },
                icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/favorite');
                },
                icon: const Icon(Icons.star),
              ),
            ],
          ),
          SizedBox(height: 12),
          _controller.listWeather.isEmpty
              ? Column(
                  children: [
                    Text("Carregando..."),
                    IconButton(
                      icon: const Icon(Icons.refresh),
                      onPressed: () {
                        _getWeather();
                      },
                    )
                  ],
                )
              : Column(children: [
                  Text(_controller.listWeather[0].city),
                  Text(_controller.listWeather[0].description),
                  Text((_controller.listWeather[0].temp -273).toString()),
                  Text((_controller.listWeather[0].tempMin -273).toString()),
                  Text((_controller.listWeather[0].tempMax -273).toString()),
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

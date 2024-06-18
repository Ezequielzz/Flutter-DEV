import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../Controller/weather_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key}); // Construtor da tela inicial

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherController _controller = new WeatherController(); // Instância do controlador de clima

  @override
  void initState() {
    super.initState();
    _getWeather(); // Método para obter o clima ao iniciar a tela
  }

  Future<void> _getWeather() async {
    try {
      // Obter a localização atual do dispositivo usando Geolocator
      Position _locator = await Geolocator.getCurrentPosition();
      print(_locator.latitude); // Imprime a latitude no console
      // Obter o clima com base na localização atual
      _controller.getWeatherLocation(
          _locator.latitude, _locator.longitude);
      setState(() {}); // Atualiza o estado para refletir as mudanças na interface
    } catch (e) {
      print(e); // Imprime qualquer erro ocorrido durante a obtenção do clima
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
        backgroundColor: Color.fromARGB(255, 0, 225, 255), // Cor de fundo da barra de aplicativo
        foregroundColor: Color.fromARGB(255, 255, 255, 255), // Cor do texto da barra de aplicativo
      ),
      body: Center(
          child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  Navigator.pushNamed(context, '/search'); // Navegar para a tela de busca ao clicar no ícone de pesquisa
                },
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/favorites'); // Navegar para a tela de favoritos ao clicar no ícone de favoritos
                },
                icon: Icon(Icons.star),
              ),
            ],
          ),
          SizedBox(height: 12),
          // Verifica se a lista de previsão do tempo está vazia
          _controller.listWeather.isEmpty
              ? Column(
                  children: [
                    CircularProgressIndicator(color: Color.fromARGB(255, 0, 225, 255)), // Indicador de progresso circular enquanto carrega o clima
                    IconButton(
                      icon: const Icon(Icons.refresh),
                      onPressed: () {
                        _getWeather(); // Atualizar o clima ao clicar no ícone de atualização
                      },
                    )
                  ],
                )
              : Column(children: [
                  Text(_controller.listWeather.last.city), // Nome da cidade da última previsão do tempo obtida
                  Text(_controller.listWeather.last.description), // Descrição da condição climática atual
                  Text('Temperatura atual: ' + (_controller.listWeather.last.temp - 273).toStringAsFixed(0) + '°'), // Temperatura atual convertida de Kelvin para Celsius
                  Text('Temperatura mínima: ' + (_controller.listWeather.last.tempMin - 273).toStringAsFixed(0) + '°'), // Temperatura mínima convertida de Kelvin para Celsius
                  Text('Temperatura máxima: ' +(_controller.listWeather.last.tempMax - 273).toStringAsFixed(0) + '°'), // Temperatura máxima convertida de Kelvin para Celsius
                  IconButton(
                    icon: const Icon(Icons.refresh),
                    onPressed: () {
                      _getWeather(); // Atualizar o clima ao clicar no ícone de atualização
                    },
                  )
                ])
        ],
      )),
    );
  }
}

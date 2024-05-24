import 'package:projeto_api_clima_loc/Service/weather_service.dart';

import '../Model/weather_model.dart';

class WeatherController {
  List<Weather> listWeather = [];
  WeatherService _service = new WeatherService();

  // Métodos
  Future<void> getWeather(String city) async {
    Weather weather = Weather.fromJson(await _service.getFromWeatherService(city));
    listWeather.add(weather);
  }

  Future<void> getWeatherLocation(double lat, double lon) async {
    Weather weather = Weather.fromJson(await _service.getFromWeatherServiceByLocation(lat, lon));
    listWeather.add(weather);
  }

  Future<bool> buscarCidade(String city) async {
    Weather weather = Weather.fromJson(await _service.getFromWeatherService(city));
    if (weather.city.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
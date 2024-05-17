class Weather {
  // Atributos

  final String city;
  final String description;
  final double temp;
  final double tempMax;
  final double tempMin;

  Weather(
      {required this.city,
      required this.description,
      required this.temp,
      required this.tempMax,
      required this.tempMin});

  // Mapeamento
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      city: json['name'],
      description: json['weather'][0]['description'],
      temp: json['main']['temp'],
      tempMax: json['main']['temp_max'],
      tempMin: json['main']['temp_min']
    );
  }
}

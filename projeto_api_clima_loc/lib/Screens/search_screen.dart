import 'package:flutter/material.dart';
import 'package:projeto_api_clima_loc/Controller/cidade_db_controller.dart';
import 'package:projeto_api_clima_loc/Controller/weather_controller.dart';
import 'package:projeto_api_clima_loc/Model/cidade_db_model.dart';
import 'package:projeto_api_clima_loc/Screens/citydetail.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _cityController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final WeatherController _controller = WeatherController();
  final CidadeDbController _cidadeDbController = CidadeDbController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Buscar Cidade',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Color.fromARGB(255, 0, 225, 255),
          foregroundColor: Color.fromARGB(255, 255, 255, 255),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Form(
                  key: _formKey,
                  child: Column(children: [
                    TextFormField(
                      controller: _cityController,
                      decoration: const InputDecoration(
                        labelText: 'Insira a cidade',
                      ),
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Por favor, insira a cidade';
                        }
                        return null;
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _buscarCidade(_cityController.text);
                        }
                      },
                      child: const Text('Search'),
                    )
                  ]))),
        ));
  }

  Future<void> _buscarCidade(String city) async {
    if (await _controller.buscarCidade(city)) {
      CidadeDb db = CidadeDb(nomeCidade: city, favorito: 0);
      _cidadeDbController.create(db); // objeto da classe city db
      // Snackbar
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Cidade encontrada!'), duration: Duration(seconds: 2)));
      // Redirecionando para a página
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CityDetailsScreen(city: city)));
    } else {
      _cityController.clear();
      // Snackbar
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Cidade inválida!'), duration: Duration(seconds: 2)));
      setState(() {});
    }
  }
}

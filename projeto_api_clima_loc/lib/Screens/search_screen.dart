import 'package:flutter/material.dart';
import 'package:projeto_api_clima_loc/Controller/cidade_db_controller.dart';
import 'package:projeto_api_clima_loc/Controller/weather_controller.dart';
import 'package:projeto_api_clima_loc/Model/cidade_db_model.dart';
import 'package:projeto_api_clima_loc/Screens/city_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key}); // Construtor da tela de busca

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _cityController =
      TextEditingController(); // Controlador para o campo de texto da cidade
  final _formKey = GlobalKey<FormState>(); // Chave global para o formulário
  final WeatherController _controller =
      WeatherController(); // Instância do controlador de clima
  final CidadeDbController _cidadeDbController =
      CidadeDbController(); // Instância do controlador de cidade do banco de dados

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
        backgroundColor: Color.fromARGB(
            255, 0, 225, 255), // Cor de fundo da barra de aplicativo
        foregroundColor: Color.fromARGB(
            255, 255, 255, 255), // Cor do texto da barra de aplicativo
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Form(
            key: _formKey, // Associa a chave global ao formulário
            child: Column(
              children: [
                TextFormField(
                  controller:
                      _cityController, // Controlador para o campo de texto da cidade
                  decoration: const InputDecoration(
                    labelText: 'Insira a cidade',
                  ),
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Por favor, insira a cidade'; // Validação do campo de texto da cidade
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _buscarCidade(_cityController
                          .text); // Chama o método para buscar a cidade ao pressionar o botão
                    }
                  },
                  child: const Text('Search'), // Texto do botão de busca
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: FutureBuilder(
                    future: _cidadeDbController
                        .getAllCidades(), // Obtém todas as cidades favoritas do banco de dados
                    builder: (context, snapshot) {
                      if (_cidadeDbController.getCidades().isEmpty) {
                        return const Center(
                            child:
                                CircularProgressIndicator()); // Indicador de progresso enquanto carrega as cidades favoritas
                      } else {
                        return ListView.builder(
                          itemCount: _cidadeDbController.getCidades().length,
                          itemBuilder: (context, index) {
                            final reversedIndex =
                                _cidadeDbController.getCidades().length -
                                    index -
                                    1;
                            return ListTile(
                              title: Text(_cidadeDbController
                                  .getCidades()[reversedIndex]
                                  .nomeCidade), // Exibe o nome da cidade favorita
                              onTap: () {
                                _buscarCidade(_cidadeDbController
                                    .getCidades()[reversedIndex]
                                    .nomeCidade); // Busca a cidade ao clicar na lista de cidades favoritas
                              },
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _buscarCidade(String city) async {
    if (await _controller.buscarCidade(city)) {
      CidadeDb db = CidadeDb(
          nomeCidade: city,
          favorito:
              0); // Cria um objeto CidadeDb com o nome da cidade e define como não favorita
      _cidadeDbController.create(db); // Salva a cidade no banco de dados
      // Snackbar para exibir mensagem de sucesso
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Cidade encontrada!'), duration: Duration(seconds: 2)));
      // Redireciona para a página de detalhes da cidade encontrada
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CityDetailsScreen(city: city)));
      setState(() {
        _cidadeDbController
            .getCidades()
            .clear(); // Limpa a lista de cidades após redirecionar para a tela de detalhes
      });
    } else {
      _cityController.clear(); // Limpa o campo de texto da cidade
      // Snackbar para exibir mensagem de cidade inválida
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Cidade inválida!'), duration: Duration(seconds: 2)));
      setState(
          () {}); // Atualiza o estado para refletir a mensagem de cidade inválida
    }
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  HomePage({required this.id});
  int id;

  @override
  State<HomePage> createState() => _HomePageState(id: id);
}

class _HomePageState extends State<HomePage> {
  late SharedPreferences
      _prefs; // Preferências compartilhadas para armazenar o estado do tema escuro
  bool _darkMode = false; // Estado atual do tema escuro
  String _idioma = 'pt-br';
  int id;

  _HomePageState({required this.id});

  @override
  void initState() {
    super.initState();
    _loadPreferences(); // Carrega as preferências compartilhadas ao iniciar a tela
  }

  Future<void> _loadPreferences() async {
    _prefs = await SharedPreferences
        .getInstance(); // Obtém as preferências compartilhadas
    setState(() {
      _darkMode = _prefs.getBool('${id}_darkMode') ??
          false; // Obtém o estado atual do tema escuro ou define como falso se não houver valor
      _idioma = _prefs.getString('${id}_idioma') ?? 'pt-br';
    });
  }

  Future<void> _toggleDarkMode() async {
    setState(() {
      _darkMode = !_darkMode; // Inverte o estado do tema escuro
    });
    await _prefs.setBool('${id}_darkMode',
        _darkMode); // Salva o estado do tema escuro nas preferências compartilhadas
  }

  Future<void> _toggleIdioma() async {
    setState(() {
      // api mudança de idioma
    });
    await _prefs.setString('${id}_idioma', _idioma);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
      data: _darkMode
          ? ThemeData.dark()
          : ThemeData.light(), // Define o tema com base no modo escuro
      duration: Duration(milliseconds: 500), // Define a duração da transição
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Inicial',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            children: [
              Switch(
                value:
                    _darkMode, // Valor do interruptor baseado no estado atual do tema escuro
                onChanged: (value) {
                  _toggleDarkMode(); // Chama a função para alternar o tema escuro
                },
              ),
              Text("Selecione o Idioma"),
              DropdownButton<String>(
                value: _idioma,
                onChanged: (value) {
                  setState(() {
                    _idioma = value!;
                  });
                },
                items: <DropdownMenuItem<String>>[
                  // Adicionando <String> para especificar o tipo
                  DropdownMenuItem<String>(
                    // Adicionando <String> para especificar o tipo
                    value: 'pt-br',
                    child: Text('Português (Brasil)'),
                  ),
                  DropdownMenuItem<String>(
                    // Adicionando <String> para especificar o tipo
                    value: 'en-us',
                    child: Text('Inglês (EUA)'),
                  ),
                  DropdownMenuItem<String>(
                    // Adicionando <String> para especificar o tipo
                    value: 'es-ar',
                    child: Text('Espanhol (Argentina)'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

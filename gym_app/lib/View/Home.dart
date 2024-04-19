import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeView extends StatefulWidget {
  String email;
  HomeView({required this.email});

  @override
  State<HomeView> createState() => _HomeViewState(email: email);
}

class _HomeViewState extends State<HomeView> {
  late SharedPreferences
      _prefs; // Preferências compartilhadas para armazenar o estado do exercicio
  bool _darkMode = false; // Estado atual do exercicio
  bool _armDay = false; // Estado atual do exercicio
  bool _chestDay = false; // Estado atual do exercicio
  bool _backDay = false; // Estado atual do exercicio
  bool _legDay = false; // Estado atual do exercicio
  bool _coreDay = false; // Estado atual do exercicio
  bool _cardioDay = false; // Estado atual do exercicio
  String email;

  _HomeViewState({required this.email});

  @override
  void initState() {
    super.initState();
    _loadPreferences(); // Carrega as preferências compartilhadas ao iniciar a tela
  }

  Future<void> _loadPreferences() async {
    _prefs = await SharedPreferences
        .getInstance(); // Obtém as preferências compartilhadas
    setState(() {
      _darkMode = _prefs.getBool('${email}_darkMode') ??
          false; // se o valor da esquerda é nulo então dê um valor false
      _armDay = _prefs.getBool('${email}_armDay') ??
          false; // se o valor da esquerda é nulo então dê um valor false
      _chestDay = _prefs.getBool('${email}_chestDay') ??
          false; // se o valor da esquerda é nulo então dê um valor false
      _backDay = _prefs.getBool('${email}_backDay') ??
          false; // se o valor da esquerda é nulo então dê um valor false
      _legDay = _prefs.getBool('${email}_legDay') ??
          false; // se o valor da esquerda é nulo então dê um valor false
      _coreDay = _prefs.getBool('${email}_coreDay') ??
          false; // se o valor da esquerda é nulo então dê um valor false
      _cardioDay = _prefs.getBool('${email}_cardioDay') ??
          false; // se o valor da esquerda é nulo então dê um valor false
    });
  }

  Future<void> _mudarDarkMode() async {
    setState(() {
      _darkMode = !_darkMode; // Inverte o estado do tema escuro
    });
    await _prefs.setBool('${email}_darkMode',
        _darkMode); // Salva o estado do tema escuro nas preferências compartilhadas
  }

  Future<void> _mudarArmDay() async {
    setState(() {
      _armDay = !_armDay; // Inverte o estado do exercicio
    });
    await _prefs.setBool('${email}_armDay',
        _armDay); // Salva o estado do tema escuro nas preferências compartilhadas
  }

  Future<void> _mudarChestDay() async {
    setState(() {
      _chestDay = !_chestDay; // Inverte o estado do exercicio
    });
    await _prefs.setBool('${email}_chestDay',
        _chestDay); // Salva o estado do tema escuro nas preferências compartilhadas
  }

  Future<void> _mudarBackDay() async {
    setState(() {
      _backDay = !_backDay; // Inverte o estado do exercicio
    });
    await _prefs.setBool('${email}_backDay',
        _backDay); // Salva o estado do tema escuro nas preferências compartilhadas
  }

  Future<void> _mudarLegDay() async {
    setState(() {
      _legDay = !_legDay; // Inverte o estado do exercicio
    });
    await _prefs.setBool('${email}_legDay',
        _legDay); // Salva o estado do tema escuro nas preferências compartilhadas
  }

  Future<void> _mudarCoreDay() async {
    setState(() {
      _coreDay = !_coreDay; // Inverte o estado do exercicio
    });
    await _prefs.setBool('${email}_coreDay',
        _coreDay); // Salva o estado do tema escuro nas preferências compartilhadas
  }

  Future<void> _mudarCardioDay() async {
    setState(() {
      _cardioDay = !_cardioDay; // Inverte o estado do exercicio
    });
    await _prefs.setBool('${email}_cardioDay',
        _cardioDay); // Salva o estado do tema escuro nas preferências compartilhadas
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
          title: Text('GymPass'), // Título da barra de aplicativos
        ),
        body: Center(
          child: ListView(
            children: [
              Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.fitness_center,
                      size: 48.0,
                      color: Color.fromARGB(255, 34, 228, 9),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      '#ArmDay',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Treino de Braço',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Checkbox(
                        value: _armDay,
                        onChanged: (value) {
                          _mudarArmDay();
                        }),
                    SizedBox(height: 16.0),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.fitness_center,
                      size: 48.0,
                      color: Color.fromARGB(255, 236, 15, 15),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      '#ChestDay',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Treino de Peito',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Checkbox(
                        value: _chestDay,
                        onChanged: (value) {
                          _mudarChestDay();
                        }),
                    SizedBox(height: 16.0),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.fitness_center,
                      size: 48.0,
                      color: const Color.fromARGB(255, 255, 238, 0),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      '#BackDay',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Treino de Costas',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Checkbox(
                        value: _backDay,
                        onChanged: (value) {
                          _mudarBackDay();
                        }),
                    SizedBox(height: 16.0),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.directions_run,
                      size: 48.0,
                      color: Color.fromARGB(255, 0, 183, 255),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      '#LegDay',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Treino de Perna',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Checkbox(
                        value: _legDay,
                        onChanged: (value) {
                          _mudarLegDay();
                        }),
                    SizedBox(height: 16.0),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.fitness_center,
                      size: 48.0,
                      color: const Color.fromARGB(255, 255, 145, 0),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      '#CoreDay',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Treino Abdominal',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Checkbox(
                        value: _coreDay,
                        onChanged: (value) {
                          _mudarCoreDay();
                        }),
                    SizedBox(height: 16.0),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.directions_run,
                      size: 48.0,
                      color: Color.fromARGB(255, 20, 83, 255),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      '#CardioDay',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Treino Cardio',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Checkbox(
                        value: _cardioDay,
                        onChanged: (value) {
                          _mudarCardioDay();
                        }),
                    SizedBox(height: 16.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

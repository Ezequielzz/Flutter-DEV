import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gym_app/View/ListaArmDay.dart';
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
  List<bool> _status = [false, false, false, false, false, false];
  List<String> _exercicio = [
    'ArmDay',
    'ChestDay',
    'BackDay',
    'LegDay',
    'CoreDay',
    'CardioDay',
  ];
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
      for (int i = 0; i < _status.length; i++) {
        _status[i] = _prefs.getBool('${email}_${_exercicio[i]}') ?? false;
      }
    });
  }

  Future<void> _mudarStatus(int index) async {
    setState(() {
      _status[index] = !_status[index];
    });
    await _prefs.setBool('${email}_${_exercicio[index]}', _status[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('GymPass'), // Título da barra de aplicativos
        ),
        body: Center(
          child: ListView.builder(
            itemCount: _exercicio.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {},
                child: Card(
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
                        color: Colors.green,
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        _exercicio[index],
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'Descrição do Exercício ${_exercicio[index]}',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Checkbox(
                        value: _status[index],
                        onChanged: (value) {
                          _mudarStatus(index);
                        },
                      ),
                      SizedBox(height: 16.0),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      );
  }
}

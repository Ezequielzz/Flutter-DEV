import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculadora(),
    );
  }
}

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  TextEditingController _controllerNumero1 = TextEditingController();
  String _resultado = '';
  int numeroSorteado = Random().nextInt(100) + 1;
  int cont = 0;
  bool acertou = false;

  void _adivinhar() {
    setState(() {
      int numero = int.tryParse(_controllerNumero1.text) ?? 0;

      if (numero != null) {
        if (numero == numeroSorteado) {
          _resultado = 'Você Acertou! Usou $cont tentativas';
          acertou = true;
          cont = 0;
          numeroSorteado = Random().nextInt(100) + 1;
        } else if (numero > numeroSorteado) {
          _resultado = 'Número Sorteado é Menor';
          cont++;
        } else if (numero < numeroSorteado) {
          _resultado = 'Número Sorteado é Maior';
          cont++;
        } else if (numero < 1) {
          _resultado = 'Tente um Número entre 1 a 100';
          cont++;
        } else if (numero > 100) {
          _resultado = 'Tente um Número entre 1 a 100';
          cont++;
        }
        cont++;
      }
    });
  }

  void _reiniciar() {
    setState(() {
      _controllerNumero1.text = '';
      _resultado = '';
      cont = 0;
      acertou = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adivinhar Número'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controllerNumero1,
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(labelText: 'Insira um número de 1 a 100'),
            ),
            SizedBox(height: 16.0),
            if (!acertou)
              ElevatedButton(
                onPressed: () => _adivinhar(),
                child: Text('Adivinhar'),
              )
            else
              ElevatedButton(
                onPressed: () => _reiniciar(),
                child: Text('Reiniciar'),
              ),
            SizedBox(height: 16.0),
            Text(
              _resultado,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProgressIndicatorDemo(),
    );
  }
}

class ProgressIndicatorDemo extends StatefulWidget {
  @override
  _ProgressIndicatorDemoState createState() => _ProgressIndicatorDemoState();
}

class _ProgressIndicatorDemoState extends State<ProgressIndicatorDemo> {
  double _progressValue = 0.0;

  void _startProgress() {
    setState(() {
      _progressValue = 0.0; // Reseta o progresso
    });

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _progressValue = 0.2; // 20% de progresso
      });
    });
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _progressValue = 0.4; // 40% de progresso
      });
    });
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _progressValue = 0.6; // 60% de progresso
      });
    });
    Future.delayed(Duration(seconds: 4), () {
      setState(() {
        _progressValue = 0.8; // 80% de progresso
      });
    });
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        _progressValue = 1.0; // 100% de progresso
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercicio 10'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LinearProgressIndicator(
              value: _progressValue,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _startProgress,
              child: Text('Iniciar Progresso'),
            ),
          ],
        ),
      ),
    );
  }
}

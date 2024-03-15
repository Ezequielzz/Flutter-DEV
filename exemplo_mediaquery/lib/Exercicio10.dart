import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _crescer = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Exercicio 10"),
        ),
        body: Center(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _crescer = !_crescer;
              });
            },
            child: AnimatedContainer(
              width: _crescer ? 300 : 100,
              height: _crescer ? 300 : 100,
              duration: const Duration(seconds: 1),
              color: _crescer ? Colors.blue : Colors.pink,
              curve: Curves.easeInOutQuint,
              child: Center(
                child: Text(
                  'Pressione',
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
// Obtém informações sobre o ambiente de exibição
    MediaQueryData mediaQueryData = MediaQuery.of(context);

// Determina a largura da tela
    double screenWidth = mediaQueryData.size.width;

// Calcula o tamanho do texto com base na largura da tela
    double textSize = screenWidth * 0.4;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Exercício 6'),
        ),
        body: Center(
          child: Container(
              width: screenWidth * 0.5,
              padding: EdgeInsets.all(5.0),
              color: Color.fromARGB(255, 229, 229, 229),
              child: Column(
                children: [
                  SizedBox(
                    width: textSize,
                    child: TextField(
                      decoration: InputDecoration(labelText: 'Nome'),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  SizedBox(
                    width: textSize,
                    child: TextField(
                      decoration: InputDecoration(labelText: 'Email'),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  SizedBox(
                    width: textSize,
                    child: TextField(
                      decoration: InputDecoration(labelText: 'Mensagem'),
                      maxLines: 3,
                    ),
                  ),
                  SizedBox(height: 32.0),
                  SizedBox(
                    width: textSize,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 115, 0, 255),
                          foregroundColor: Color.fromARGB(255, 255, 255, 255)),
                      child: Text(
                        "Enviar",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}

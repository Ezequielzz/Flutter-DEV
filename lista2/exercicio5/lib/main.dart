import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    double screenWidth = mediaQueryData.size.width;

    double imageSize = screenWidth * 0.04;
    double titleSize = screenWidth * 0.04;
    double textSize = screenWidth * 0.03;
    
    return MaterialApp(
      title: 'Exercicio 5',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Exercicio 5'),
        ),
        body: Container(
          child: Container(
            padding: EdgeInsets.all(20.0),
            color: Colors.grey[200],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hello World :)',
                  style: TextStyle(fontSize: titleSize),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: imageSize,
                    ),
                    Text(
                      'Flutter',
                      style: TextStyle(fontSize: textSize),
                    ),
                    Image.asset(
                      'assets/images/mclaren.png',
                      width: imageSize,
                      height: imageSize,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

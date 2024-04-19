import 'package:flutter/material.dart';
import 'package:gym_app/View/Home.dart';
import 'package:gym_app/View/Login.dart';

import 'View/Login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SA2",
      debugShowCheckedModeBanner: false,
      home: LoginView(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:projeto_apirest/Controller/controller.dart';

class CadatroScreen extends StatefulWidget {
  const CadatroScreen({super.key});

  @override
  State<CadatroScreen> createState() => _CadatroScreenState();
}

class _CadatroScreenState extends State<CadatroScreen> {
  ProdutoController _controller = ProdutoController();
  TextEditingController _idController = TextEditingController();
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _precoController = TextEditingController();

  Future<void> _cadastrarProduto() async {
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
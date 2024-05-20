import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _cityController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Encontrar Cidade..."),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _cityController,
                    decoration:
                        InputDecoration(
                          labelText: 'Insira a cidade...'
                          ),
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return 'Insira uma cidade válida!';
                            }
                            return null;
                          },
                  ),
                  IconButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => ))
                      }
                  }, 
                  icon: Icon(Icons.search))
                ],
              ),
            ),
          ),
        ));
  }
}

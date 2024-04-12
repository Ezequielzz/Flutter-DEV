import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback onLogout;
  final String userEmail;

  HomeScreen({required this.onLogout, required this.userEmail});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SharedPreferences _prefs;
  bool _darkMode = false;
  double _textSize = 20;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  String _getUserKey() {
    return 'darkMode_${widget.userEmail}';
  }

  Future<void> _loadPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _darkMode = _prefs.getBool(_getUserKey()) ?? false;
      _textSize = _prefs.getDouble('textSize_${widget.userEmail}') ?? 20;
    });
  }

  Future<void> _toggleDarkMode() async {
    setState(() {
      _darkMode = !_darkMode;
    });
    await _prefs.setBool(_getUserKey(), _darkMode);
  }

  Future<void> _setTextSize(double size) async {
    setState(() {
      _textSize = size;
    });
    await _prefs.setDouble('textSize_${widget.userEmail}', size);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: _darkMode ? Brightness.dark : Brightness.light,
        textTheme: TextTheme(
          bodyText1: TextStyle(fontSize: _textSize),
        ),
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Início'),
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                ),
                Tab(text: 'Tab 2'),
                Tab(text: 'Tab 3'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 20),
                    Switch(
                      value: _darkMode,
                      onChanged: (value) {
                        _toggleDarkMode();
                      },
                    ),
                  ],
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Escolha o Tamanho da Fonte!',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        _setTextSize(10);
                      },
                      child: Text(
                        '10px',
                        style: TextStyle(fontSize: _textSize),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _setTextSize(20);
                      },
                      child: Text(
                        '20px',
                        style: TextStyle(fontSize: _textSize),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _setTextSize(30);
                      },
                      child: Text(
                        '30px',
                        style: TextStyle(fontSize: _textSize),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Bem-vindo à tela inicial - Tab 3!',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Chamar função de logout
                        widget.onLogout();
                      },
                      child: Text('Logout'),
                    ),
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

import 'package:exemplo_mplayer/Controller/music_controller.dart';
import 'package:exemplo_mplayer/Screen/music_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MusicController _controller = MusicController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Color.fromARGB(255, 0, 0, 0)),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 10),
            Text(
              'Music',
              style: TextStyle(
                color: Color.fromARGB(255, 50, 168, 82),
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Player',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Color.fromARGB(255, 0, 0, 0)),
            onPressed: () {
              _getList();
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications,
                color: Color.fromARGB(255, 0, 0, 0)),
            onPressed: () {
              // Add your notifications functionality here
            },
          ),
        ],
      ),
      body: //future.builder,
          Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: FutureBuilder(
            future: _getList(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (_controller.list.isEmpty) {
                return const Center(
                  child: Text("Músicas não encontradas..."),
                );
              } else {
                return ListView.builder(
                  itemCount: _controller.list.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_controller.list[index].title),
                      subtitle: Text(_controller.list[index].artist),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MusicScreen(
                              music: _controller.list[index],
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Future<void> _getList() async {
    try {
      _controller.fetchFromFireStore();
    } catch (e) {
      print(e.toString());
    }
  }
}

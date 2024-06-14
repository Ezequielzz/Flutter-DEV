import 'package:exemplo_mplayer/Model/music.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicScreen extends StatefulWidget {
  final Music music;
  const MusicScreen({super.key, required this.music});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  bool _isPlaying = false;
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _audioPlayer = AudioPlayer();
    _audioPlayer.play(UrlSource(widget.music.url));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _audioPlayer.dispose();
  }

  void playPause() {
    if (_isPlaying) {
      _audioPlayer.pause();
      setState(() {
        _isPlaying = false;
      });
    } else{
      _audioPlayer.play(UrlSource(widget.music.url));
      setState(() {
        _isPlaying = true;
      });
    }
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(0, 0, 0, 0),
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.menu, color: const Color.fromARGB(255, 0, 0, 0)),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 5),
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
              const SizedBox(
                  height:
                      4), // Espaço entre o título principal e o nome da música
              Text(
                widget.music.title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon:
                  Icon(Icons.search, color: const Color.fromARGB(255, 0, 0, 0)),
              onPressed: () {
                // Adicione a funcionalidade de pesquisa aqui
              },
            ),
            IconButton(
              icon: const Icon(Icons.notifications,
                  color: Color.fromARGB(255, 0, 0, 0)),
              onPressed: () {
                // Adicione a funcionalidade de notificações aqui
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  playPause();
                },
                icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                iconSize: 60,
              )
            ],
          ),
        ));
  }
}

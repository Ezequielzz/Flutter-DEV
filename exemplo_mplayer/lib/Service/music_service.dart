import 'dart:convert';

import 'package:exemplo_mplayer/Model/music.dart';
import 'package:http/http.dart' as http;

class MusicService{
  final Uri url = "http://URL_JSON.com" as Uri;

  List<Music> _listMusic = [];
  List<Music> get listMusic => _listMusic;

  // fetch lista de musicas 
  Future<List<Music>> fetchListMusic() async {
    final response = await http.get(url);
    if(response.statusCode == 200){
      _listMusic = json.decode(response.body).map<Music>((item) =>
       Music.fromJson(item)).toList();
    }
    return _listMusic;
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exemplo_mplayer/Model/music.dart';

class MusicController {
  List<Music> _list = [];
  List<Music> get list => _list;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Métodos
  Future<void> fetchFromFireStore() async {
    QuerySnapshot querySnapshot = await _firestore.collection('music').get();
    List<dynamic> result = querySnapshot.docs as List;
    _list = result.map((doc)=>Music.fromMap(doc.data())).toList();
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_api/Model/todolist.dart';

class TodolistController {
  List<Todolist> _list = [];
  List<Todolist> get list => _list;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // add to firestore
  Future<void> add(Todolist todolist) async {
    await _firestore.collection('todolist').add(todolist.toMap());
  }

  // delete from firestore
  Future<void> delete(String id) async {
    await _firestore.collection('todolist').doc(id).delete();
  }

  // get from firestore
  Future<void> getFromFirebase(String userId) async {
    QuerySnapshot querySnapshot = await _firestore.collection('todolist')
      .where('userId', isEqualTo: userId).get();
    _list = querySnapshot.docs.map((doc) {
      return Todolist.fromMap(doc.data() as Map<String, dynamic>, doc.id);
    }).toList();
  }
}

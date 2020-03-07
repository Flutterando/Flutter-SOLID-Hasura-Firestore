import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  String title;
  bool check;
  DocumentReference reference;
  int id;

  TodoModel({this.reference, this.title = '', this.check = false, this.id});

  factory TodoModel.fromDocument(DocumentSnapshot doc) {
    return TodoModel(
        title: doc['title'], check: doc['check'], reference: doc.reference);
  }

  factory TodoModel.fromJson(Map doc) {
    return TodoModel(title: doc['title'], check: doc['check'], id: doc['id']);
  }
}

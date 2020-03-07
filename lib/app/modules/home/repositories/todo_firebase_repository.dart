import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_todo/app/modules/home/models/todo_model.dart';

import 'todo_repository_interface.dart';

class TodoFirebaseRepository implements ITodoRepository {
  final Firestore firestore;

  TodoFirebaseRepository(this.firestore);

  @override
  Stream<List<TodoModel>> getTodos() {
    return firestore
        .collection('todo')
        .orderBy('position')
        .snapshots()
        .map((query) {
      return query.documents.map((doc) {
        return TodoModel.fromDocument(doc);
      }).toList();
    });
  }

  @override
  Future save(TodoModel model) async {
    if (model.reference == null) {
      int total =
          (await firestore.collection('todo').getDocuments()).documents.length;
      model.reference = await Firestore.instance
          .collection('todo')
          .add({'title': model.title, 'check': model.check, 'position': total});
    } else {
      model.reference.updateData({'title': model.title, 'check': model.check});
    }
  }

  @override
  Future delete(TodoModel model) {
    return model.reference.delete();
  }
}

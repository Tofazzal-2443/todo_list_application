import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list_application/models/todo_model.dart';
import 'package:todo_list_application/util/app_constants.dart';

class TodoRepo{
  //SharedPreferences
  final SharedPreferences sharedPreferences;
  TodoRepo({required this.sharedPreferences});

  void setOnBoardingSelected (bool value) {
    sharedPreferences.setBool(AppConstants.onBoarding, value);
  }

  bool? getOnBoardingSelected () {
    return sharedPreferences.getBool(AppConstants.onBoarding);
  }

  //Firebase
  final _db = FirebaseFirestore.instance;

  //Send data to Firebase
  Future<void> addNote(ToDoModel toDoModel) {
    final noteDoc = _db.collection(AppConstants.collectionNote).doc();
    toDoModel.id = noteDoc.id;
    return noteDoc.set(toDoModel.toMap());
  }

  //Get data from Firebase
  Stream<QuerySnapshot<Map<String, dynamic>>> getAllNote() =>
      _db.collection(AppConstants.collectionNote).snapshots();

  //Update Data
  Future<void> updateNote(
      String noteId, Map<String, dynamic> map) {
    return _db.collection(AppConstants.collectionNote).doc(noteId).update(map);
  }
}
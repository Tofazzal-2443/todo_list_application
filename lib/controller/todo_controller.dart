import 'package:get/get.dart';
import 'package:todo_list_application/models/todo_model.dart';
import 'package:todo_list_application/repository/todo_repo.dart';

class TodoController extends GetxController implements GetxService {
  //SharedPreferences
  final TodoRepo todoRepo;
  TodoController({required this.todoRepo});

  bool? getOnBoardingSelected () {
    return todoRepo.getOnBoardingSelected();
  }

  void setOnBoardingSelected (bool value) {
    todoRepo.setOnBoardingSelected(value);
  }

  //Send data to Firebase
  Future<void> addNote(ToDoModel toDoModel) {
    return todoRepo.addNote(toDoModel);
  }

  //Get data from Firebase
  List<ToDoModel>? _todoList;
  List<ToDoModel>? get todoList => _todoList;

  Future<void> getAllNote() async {
    _todoList = [];
    todoRepo.getAllNote().listen((snapshot) {
      _todoList = List.generate(snapshot.docs.length,
              (index) => ToDoModel.fromMap(snapshot.docs[index].data()));
      update();
    });
  }
  //Update Data
  bool _isUpdateNote = false;
  bool get isUpdateNote => _isUpdateNote;

  Future<void> updateNote(String noteId, Map<String, dynamic> map) async {
    return todoRepo.updateNote(noteId, map);
  }

  void setUpdateNoteStatus (bool value) {
    _isUpdateNote = value;
    update();
  }

  //Delete data
  Future<void> deleteNote(String noteId) async {
    return todoRepo.deleteNote(noteId);
  }


}
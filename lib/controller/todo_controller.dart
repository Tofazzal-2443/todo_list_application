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
}
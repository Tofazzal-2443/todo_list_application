import 'package:get/get.dart';
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
}
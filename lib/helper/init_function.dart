import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list_application/controller/todo_controller.dart';
import 'package:todo_list_application/repository/todo_repo.dart';

Future<void> initFunction () async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  // controller
  Get.lazyPut(() => TodoController(todoRepo: Get.find()));

  //repository
  Get.lazyPut(() => TodoRepo(sharedPreferences: Get.find()));
}
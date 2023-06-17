import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_application/controller/todo_controller.dart';
import 'package:todo_list_application/helper/init_function.dart';
import 'package:todo_list_application/helper/route_helper.dart';


//Responsive UI use MediaQuery Global Key
late Size mq;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initFunction();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialRoute:  Get.find<TodoController>().getOnBoardingSelected() != null ? RouteHelper.getHomeRoute() : RouteHelper.getOnBoardingRoute(),
      getPages: RouteHelper.routes,
    );
  }
}

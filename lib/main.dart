import 'package:flutter/material.dart';
import 'package:todo_list_application/pages/onboarding_page.dart';


//Responsive UI use MediaQuery Global Key
late Size mq;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: OnBoardingPage(),
    );
  }
}

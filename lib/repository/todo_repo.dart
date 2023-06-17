import 'package:shared_preferences/shared_preferences.dart';
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

}
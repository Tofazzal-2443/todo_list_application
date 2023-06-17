import 'package:get/get.dart';
import 'package:todo_list_application/pages/home_page.dart';
import 'package:todo_list_application/pages/onboarding_page.dart';


class RouteHelper {
  static const String home = '/home';
  static const String onBoarding = '/on-boarding';

  static getHomeRoute () => home;
  static getOnBoardingRoute () => onBoarding;

  static List<GetPage> routes = [
    GetPage(name: home, page: () => const HomePage()),
    GetPage(name: onBoarding, page: () => const OnBoardingPage()),
  ];
}
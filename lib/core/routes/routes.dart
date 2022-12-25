import 'package:flutter/material.dart';
import 'package:task_management/pages/home.dart';
import 'package:task_management/pages/nampilinAPI.dart';
import 'package:task_management/pages/nampilinDiklat.dart';
import 'package:task_management/pages/nampilinGelar.dart';
import 'package:task_management/pages/nampilinPenelitian.dart';
import 'package:task_management/pages/onboarding.dart';
import 'package:task_management/pages/today_task.dart';

class Routes {
  static const onBoarding = "/";
  static const home = "/home";
  static const todaysTask = "/task/todays";
  static const api = "/api";
  static const diklat = "/diklat";
  static const penelitian = "/penelitian";
  static const gelar = "/gelar";


}

class RouterGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(
          builder: ((context) => OnboardingScreen()),
        );
        case Routes.api:
        return MaterialPageRoute(
          builder: ((context) => const ListMahasiswaScreen()),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: ((context) => const HomeScreen()),
        );
      case Routes.todaysTask:
        return MaterialPageRoute(
          builder: ((context) => const TodaysTaskScreen()),
        );
      case Routes.diklat:
        return MaterialPageRoute(
          builder: ((context) => const ListDiklatScreen()),
        );
      case Routes.penelitian:
        return MaterialPageRoute(
          builder: ((context) => const ListPenelitianScreen()),
        );
      case Routes.gelar:
        return MaterialPageRoute(
          builder: ((context) => const ListGelarScreen()),
        );
      default:
        return MaterialPageRoute(
          builder: ((context) => const HomeScreen()),
        );
    }
  }
}

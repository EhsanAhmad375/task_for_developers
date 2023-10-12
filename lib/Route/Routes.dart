import 'RouteName.dart';
import '../Screens/Profile.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:flutter/cupertino.dart';
import '../Screens/BottomNavBarCustom.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:task_for_developers/Screens/Home.dart';
import 'package:task_for_developers/Model/filtered.dart';
import 'package:task_for_developers/Screens/Filtered.dart';
import 'package:task_for_developers/Screens/Job_Details_Duties.dart';
import 'package:task_for_developers/Screens/job_detail_description.dart';
import 'package:task_for_developers/Screens/JobDetailSkillsRequired.dart';





class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.BottomNavBarCustom:
        return GetPageRoute(page: () => BottomNavBarCustom());
      case RouteName.home:
        return GetPageRoute(page: () => Home());
      case RouteName.filterd:
        return GetPageRoute(page: () => Filtered());
      case RouteName.jobDetailDescription:
        return GetPageRoute(page: () => JobDetailDescription(data: settings.arguments as FilterModel,));
      case RouteName.jobDetailDuties:
        return GetPageRoute(page: () => JobDetailDuties(data: settings.arguments as FilterModel,));
      case RouteName.jobDetailsSkillsRequred:
        return GetPageRoute(page: () => JobDetailsSkillsRequred(data: settings.arguments as FilterModel,));
      case RouteName.profile:
        return GetPageRoute(page: () => Profile());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('No Route Found'),
            ),
          ),
        );
    }
  }
}

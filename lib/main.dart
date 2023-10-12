import 'Route/Routes.dart';
import 'Route/RouteName.dart';
import 'Provider/job_provider.dart';
import 'Provider/select_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_for_developers/Common/AppColor.dart';
import 'package:task_for_developers/Provider/filterProvider.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';





void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        
      providers: [
        ChangeNotifierProvider(create: (_) => JobTypePRovider()),
        ChangeNotifierProvider(create: (_) => FilterProvider()),
        
        
      ],
      child: GetMaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.purple,
          


        ),
        debugShowCheckedModeBanner: false,
        initialRoute: RouteName.BottomNavBarCustom,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}

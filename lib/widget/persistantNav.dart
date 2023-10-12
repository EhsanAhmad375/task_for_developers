import 'package:get/get.dart';
import '../Screens/Home.dart';
import '../Common/AppColor.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:task_for_developers/Screens/Profile.dart';
import 'package:task_for_developers/Screens/Filtered.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:task_for_developers/Screens/job_detail_description.dart';



class MyPersistent extends StatelessWidget {
  MyPersistent({Key? key}) : super(key: key);

  // Create GetX controller to manage the state
  final controller = Get.put<PersistentTabController>(PersistentTabController(initialIndex: 0));

  List<Widget> _buildScreen() {
    return [
      Home(),
      Center(child:Text('Screen 2')),
      Filtered(),
      
      
      
      Profile(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItem() {
    return [
      PersistentBottomNavBarItem(
        
        activeColorPrimary: Color.fromARGB(255, 9, 103, 180),
        icon: ImageIcon(AssetImage('asset/Home.png')),
        
        inactiveColorPrimary: Colors.grey,
        activeColorSecondary: AppColors.darkPurple
      ),
      PersistentBottomNavBarItem(
        
        activeColorPrimary: Color.fromARGB(255, 9, 103, 180),
        icon: ImageIcon(AssetImage('asset/Card Search.png')),
        inactiveColorPrimary: Colors.grey,
        activeColorSecondary: AppColors.darkPurple
      
      
      ),
      PersistentBottomNavBarItem(
        inactiveColorPrimary: Colors.grey,
        activeColorSecondary: AppColors.darkPurple,
        
        icon: ImageIcon(AssetImage('asset/Bell.png')),
      ),
      
      PersistentBottomNavBarItem(
        
        activeColorPrimary: Color.fromARGB(255, 9, 103, 180),
        icon: Icon(Icons.person_3_outlined,),
        inactiveColorPrimary: Colors.grey,
        activeColorSecondary: AppColors.darkPurple
        
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      
      context,
      controller: controller,
      screens: _buildScreen(),
      items: _navBarItem(),
      decoration: NavBarDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
      ),
      navBarStyle: NavBarStyle.neumorphic,
      backgroundColor: Colors.white,
    );
  }
}

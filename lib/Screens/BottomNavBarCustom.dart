import 'Home.dart';
import 'Profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/route_manager.dart';
import 'package:task_for_developers/Common/AppColor.dart';
import 'package:task_for_developers/Screens/Filtered.dart';






class BottomNavBarCustom extends StatefulWidget {
  @override
  _BottomBarCusState createState() => _BottomBarCusState();
}

class _BottomBarCusState extends State<BottomNavBarCustom> {
  int selectedIndex = 0;

  final List<Widget> classes = [
    Home(),
    Filtered(),
    Center(child: Text('Screen 3')),
    Profile(),
  ];

  void onTabTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final media=MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: classes[selectedIndex],
        bottomNavigationBar: BottomAppBar(
            elevation: 0,
            color: Colors.transparent,
            child: Stack(
              children: [
                Container(
                  height: 80,
                  color: Colors.transparent,
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: 400,
                    height: 65,
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.only(
                      //   topLeft: Radius.circular(30),
                      //   topRight: Radius.circular(30),
                      //  ),
                      color: AppColors.green,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Stack(
                        
                        children: [
                          
                          // buildNavItem(Icons.map, 0, "Map", 30),
                          Positioned(
                            left: 20,
                            bottom: selectedIndex==0?15:null,
                            child: buildNavItem(
                                Icons.home_work_sharp, 0, "Home", 35),
                          ),
                          Positioned(
                            left: 110,
                             bottom: selectedIndex==1?15:null,
                            child: buildNavItem(
                                Icons.card_travel, 1, "Jobs", 35),
                          ),
                          Positioned(
                            right: 110,
                            bottom: selectedIndex==2?15:null,
                            child: buildNavItem(Icons.notifications_none_sharp,2 ,
                                "Notification", 30),
                          ),
                          Positioned(
                            right: 20,
                            bottom: selectedIndex==3?15:null,
                            child: buildNavItem(CupertinoIcons.person, 3, "profile", 30)),
                        ],
                      ),
                    ),
                  ),
                ),
             
                
              ],
            )),
      ),
    );
  }

  Widget buildNavItem(IconData icon, int index, String tooltip, double sizes) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
color:selectedIndex == index? AppColors.white:null,
shape: BoxShape.circle
          ),
          
          
          child: Center(
            child: IconButton(
              onPressed: () => onTabTapped(index),
              icon: Icon(
                icon,
                color: selectedIndex == index ? Color(0xff683cb7) : Colors.white70,
                size: sizes,
              ),
              tooltip: tooltip,
            ),
          ),
        ),
        Text(
          tooltip,
          style: TextStyle(
              color: selectedIndex == index ? AppColors.darkPurple : AppColors.white,
              fontWeight:
                  selectedIndex == index ? FontWeight.w600 : FontWeight.w400,
              fontSize: 12),
        )
      ],
    );
  }
}

import '../Model/MenuModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:task_for_developers/Common/AppColor.dart';

class MyListView extends StatelessWidget {
  MyListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(
                'asset/profile.png'), // Use 'AssetImage' to load the image from assets
            radius: 25,
          ),
          title: Text(
            'Umer Farooq',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600
            ),
          ),
          trailing: Icon(Icons.arrow_back_sharp, color: AppColors.white),
        ),
        Expanded(
          child: ListView.builder(
  itemCount: menuList.length,
  itemBuilder: (context, index) {
    return ListTile(
      leading: Icon(
        menuList[index].icons,
        color: AppColors.white,
      ),
      title: Text(
        '${menuList[index].title}',
        style: TextStyle(color: AppColors.white,
        fontSize: 17,
        fontWeight: FontWeight.w500
        ),
      ),
    );
  },
)
)
      ],
    );
  }

  List<MenuModel> menuList = [
    MenuModel(title: 'Profile', icons: CupertinoIcons.person),
    MenuModel(title: 'History', icons: Icons.history),
    MenuModel(
        title: 'Mute Notification', icons: Icons.notifications_off_outlined),
    MenuModel(title: 'Settings', icons: Icons.settings_applications),
    MenuModel(title: 'F&Q', icons: Icons.message_rounded),
    MenuModel(title: 'Support', icons: Icons.face),
  ];

  
}

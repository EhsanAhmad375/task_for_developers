import 'package:flutter_svg/svg.dart';
import '../Provider/job_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:task_for_developers/Route/RouteName.dart';
import 'package:task_for_developers/Common/AppColor.dart';
import 'package:task_for_developers/widget/myListView.dart';
import 'package:task_for_developers/widget/RoundButton.dart';
import 'package:task_for_developers/widget/TextFieldCustom.dart';
import 'package:get/get_connect/http/src/_http/_stub/_file_decoder_stub.dart';



class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff691DB3), Color(0xff31FE9C)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: MyListView(),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: media.height * 0.25,
                width: media.width,
                decoration: BoxDecoration(
                    color: AppColors.darkPurple,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: media.height * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SvgPicture.asset('asset/Menu.svg')
                    ),
                    ListTile(
                      title: Text(
                        'Umar Farooq',
                        style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: media.height * 0.005,
                          ),
                          Text(
                            '12:22 AM',
                            style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 15),
                          ),
                          SizedBox(
                            height: media.height * 0.005,
                          ),
                          Text(
                            '2023-12-23',
                            style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 15),
                          ),
                        ],
                      ),
                      trailing: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('asset/profile.png'),
                      ),
                    ),
                    SizedBox(
                      height: media.height * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Expanded(
                              child: TextFieldCustom(
                            prefixIcons: Icons.search,
                            isPrefix: true,
                            hint: 'Search Job',
                          )),
                          SizedBox(
                            width: media.width * 0.02,
                          ),
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: AppColors.white,
                            height: media.height * 0.06,
                            minWidth: media.width * 0.07,
                            onPressed: () {
                              bottomSheet(context, media);
                            },
                            child: Icon(
                              Icons.more_horiz_sharp,
                              color: AppColors.darkPurple,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void bottomSheet(BuildContext context, Size media) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      builder: (BuildContext context) {
        return Container(
          height: media.height * 0.9,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Consumer<JobTypePRovider>(
                builder: (context, jobProvider, child) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: media.height * 0.02,
                  ),
                  Center(
                    child: Container(
                      width: media.width * 0.07,
                      height: media.height * 0.005,
                      color: AppColors.green,
                      child: SizedBox(),
                    ),
                  ),
                  Visibility(
                    visible: jobProvider.isVisibleSalary,
                    child: InkWell(
                      onTap: (){
                        jobProvider.toggleVisibility();
                        jobProvider.toggleVisibilitySalart();
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: media.width * 0.02,
                          ),
                          Icon(
                            Icons.check_circle_outline,
                            color: AppColors.green,
                          ),
                          SizedBox(
                            width: media.width * 0.04,
                          ),
                          Text(
                            'Salary Range',
                            style: TextStyle(color: AppColors.green, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: jobProvider.isVisible,
                    child: InkWell(
                      onTap: () {
                        jobProvider.toggleVisibility();
                        jobProvider.toggleVisibilitySalart();
                      },
                      child: Text(
                        'Salary Range',
                        style: TextStyle(
                            color: AppColors.darkPurple,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  SizedBox(height: media.height * 0.02),
                  Visibility(
                    visible: jobProvider.isVisible,
                    child: Container(
                      height: media.height * 0.13,
                      child: ListView.builder(
                          itemCount: 2,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${jobProvider.salaryList[index].min_max}',
                                  style: TextStyle(
                                      color: AppColors.darkPurple,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: media.height * 0.02,
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 7),
                                    child: Material(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      elevation: 5,
                                      child: Container(
                                        child: Center(
                                          child: Text(
                                            '${jobProvider.salaryList[index].salaryRange}',
                                            style: TextStyle(
                                                color: AppColors.darkPurple,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        height: media.height * 0.06,
                                        width: media.width * 0.43,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            );
                          }),
                    ),
                  ),
                  Text(
                    'Job Type',
                    style: TextStyle(
                        color: AppColors.darkPurple,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: media.height * 0.02),
                  Container(
                    height: media.height * 0.25,
                    child: GridView.builder(
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2.8,
                  mainAxisSpacing: 0.5,
                ),
                itemCount: jobProvider.jobTypeList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      jobProvider.selectItem(index);
                    },
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7),
                        child: Material(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 5,
                          color: jobProvider.jobTypeList[index].isSelected
                              ? AppColors.darkPurple // Change the color for the selected item
                              : Colors.white,
                          child: Container(
                            child: Center(
                              child: Text(
                                '${jobProvider.jobTypeList[index].JobType}',
                                style: TextStyle(
                                  color: jobProvider.jobTypeList[index].isSelected
                              ? AppColors.white // Change the color for the selected item
                              : AppColors.darkPurple,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            height: media.height * 0.06,
                            width: media.width * 0.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
                  ),
                  Text(
                    'Experience Level',
                    style: TextStyle(
                        color: AppColors.darkPurple,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: media.height * 0.03,
                  ),
                  Container(
                    height: media.height * 0.15,
                    child: ListView.builder(
                        itemCount: jobProvider.level.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: media.width * 0.02,
                                ),
                                Icon(
                                  Icons.check_circle_outline,
                                  color: AppColors.green,
                                ),
                                SizedBox(
                                  width: media.width * 0.04,
                                ),
                                Text(
                                  '${jobProvider.level[index]}',
                                  style: TextStyle(
                                      color: AppColors.green, fontSize: 15),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                  Center(
                      child: RoundButton(
                    title: 'Show Results',
                    onTap: () {
                      Navigator.of(context).pushNamed(RouteName.filterd);
                    },
                    heights: media.height * 0.055,
                    widths: media.width * 0.5,
                  ))
                ],
              );
            }),
          ),
        );
      },
    );
  }
}

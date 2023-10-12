import '../Common/AppColor.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_for_developers/Route/RouteName.dart';
import 'package:task_for_developers/widget/RoundButton.dart';
import 'package:task_for_developers/Provider/filterProvider.dart';


// ignore_for_file: public_member_api_docs, sort_constructors_first

class JobDetailDescription extends StatelessWidget {
  dynamic data;
  JobDetailDescription({
    Key? key,
    required this.data,
  }) : super(key: key);

  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body:
            Consumer<FilterProvider>(builder: (context, filterProvider, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: media.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      'asset/Menu.svg',
                      color: AppColors.darkPurple,
                    ),
                    Icon(Icons.arrow_back_rounded, color: AppColors.darkPurple),
                  ],
                ),
                SizedBox(
                  height: media.height * 0.01,
                ),
                Divider(
                  color: AppColors.darkPurple,
                  thickness: 1,
                ),
                SizedBox(height: media.height * 0.05),
                Center(
                  child: Column(
                    children: [
                      Container(
                        height: media.height * 0.1,
                        width: media.width * 0.22,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: data.color),
                      ),
                      SizedBox(height: media.height * 0.015),
                      Text(
                        'Company name',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.darkPurple),
                      ),
                      SizedBox(height: media.height * 0.015),
                      Text(
                        '${data.title}',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: AppColors.darkPurple),
                      ),
                      SizedBox(height: media.height * 0.015),
                      Text(
                        '${data.loc}',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.darkPurple),
                      ),
                      SizedBox(height: media.height * 0.015),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: media.height * 0.033,
                            width: media.width * 0.25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: AppColors.darkPurple,
                                    width: media.width * 0.003)),
                            child: Center(
                                child: Text(
                              data.duration,
                              style: TextStyle(color: AppColors.darkPurple),
                            )),
                          ),
                          Container(
                            height: media.height * 0.035,
                            width: media.width * 0.43,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: AppColors.darkPurple,
                                    width: media.width * 0.003)),
                            child: Center(
                                child: Text(
                              data.range,
                              style: TextStyle(color: AppColors.darkPurple),
                            )),
                          ),
                          Container(
                            height: media.height * 0.033,
                            width: media.width * 0.25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: AppColors.darkPurple,
                                    width: media.width * 0.003)),
                            child: Center(
                                child: Text(
                              data.day,
                              style: TextStyle(color: AppColors.darkPurple),
                            )),
                          )
                        ],
                      ),
                      SizedBox(
                        height: media.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Posted on: 2023-08-08',
                            style: TextStyle(color: AppColors.darkPurple),
                          ),
                          Text('Expire on: 2023-09-08',
                              style: TextStyle(color: AppColors.darkPurple)),
                        ],
                      ),
                      SizedBox(
                        height: media.height * 0.03,
                      ),
                      Container(
                        height: media.height * 0.07,
                        width: media.width * 0.95,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.darkPurple),
                            borderRadius: BorderRadius.circular(15)),
                        child: ListView.builder(
                            controller: _scrollController,
                            itemCount: 2,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  filterProvider.selectItem(index);
                                },
                                child: Container(
                                  height: media.height * 0.1,
                                  width: media.width * 0.475,
                                  child: Center(
                                      child: Text(
                                    '${filterProvider.cardList[index]}',
                                    style: TextStyle(
                                      color:
                                          filterProvider.selectedIndex == index
                                              ? AppColors.white
                                              : AppColors.darkPurple,
                                    ),
                                  )),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: filterProvider.selectedIndex ==
                                              index
                                          ? AppColors
                                              .darkPurple // Change color for selected item
                                          : AppColors.white,
                                      border:
                                          filterProvider.selectedIndex == index
                                              ? Border.all(
                                                  color: AppColors.darkPurple)
                                              : null),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: media.height * 0.02,
                ),
                Text(
                  'About the Opportunity',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColors.darkPurple),
                ),
                SizedBox(
                  height: media.height * 0.01,
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                  style: TextStyle(color: AppColors.darkPurple),
                ),
                SizedBox(
                  height: media.height * 0.02,
                ),
                Text(
                  'Job Responsibilities',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColors.darkPurple),
                ),
                SizedBox(
                  height: media.height * 0.01,
                ),
                Text(
                  '.  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ',
                  style: TextStyle(color: AppColors.darkPurple),
                ),
                Text(
                  '.  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ',
                  style: TextStyle(color: AppColors.darkPurple),
                ),
                SizedBox(
                  height: media.height * 0.01,
                ),
                Row(
                  children: [
                    Container(
                      height: media.height * 0.07,
                      width: media.width * 0.156,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.darkPurple)),
                      child: Center(
                          child:
                              SvgPicture.asset('asset/fontisto_favorite.svg',height: media.height*0.04,),),
                    ),
                    SizedBox(
                      width: media.width * 0.04,
                    ),
                    Expanded(
                        child: RoundButton(
                      title: 'Apply for Job',
                      onTap: () {
                        Navigator.of(context).pushNamed(RouteName.jobDetailDuties,
                        arguments:data
                        );
                      },
                      heights: media.height * 0.07,
                    ))
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

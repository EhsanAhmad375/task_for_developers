import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_for_developers/Common/AppColor.dart';
import 'package:task_for_developers/Route/RouteName.dart';
import 'package:task_for_developers/Provider/filterProvider.dart';

class Filtered extends StatelessWidget {
  const Filtered({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.darkPurple,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: media.height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset('asset/Menu.svg'),
                  Icon(
                    Icons.arrow_back_rounded,
                    color: AppColors.white,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: media.height * 0.01,
            ),
            Divider(
              color: AppColors.white,
              thickness: 1,
              endIndent: 15,
              indent: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 13, top: 10),
              child: Text(
                'Filtered Jobs',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white),
              ),
            ),
            SizedBox(
              height: media.height * 0.02,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    )),
                child: Consumer<FilterProvider>(
                    builder: (context, filterProvider, child) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Container(
                      height: media.height*0.85,
                      child: ListView.builder(
                          itemCount: filterProvider.filterList.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: (){
                                Navigator.of(context).pushNamed(RouteName.jobDetailDescription,
                                arguments: filterProvider.filterList[index]
                                );
                              },
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10),
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            height: media.height * 0.07,
                                            width: media.width * 0.17,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                color: filterProvider
                                                    .filterList[index].color),
                                          ),
                                          SizedBox(height: media.height*0.02,)
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: media.width*0.73,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    '${filterProvider.filterList[index].title}',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w600,
                                                        color: AppColors.darkPurple),
                                                  ),
                                                  SvgPicture.asset('asset/fontisto_favorite.svg')
                                                ],
                                              ),
                                            ),
                                          SizedBox(height: media.height*0.01,),
                                            Container(
                                              width: media.width*0.73,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    '${filterProvider.filterList[index].loc}',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w400,
                                                        color: AppColors.darkPurple),
                                                  ),
                                                  Text(
                                                    '${filterProvider.filterList[index].day}',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w400,
                                                        color: AppColors.darkPurple),
                                                  ),
                                      
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: media.height*0.01,),
                                            Container(
                                              width: media.width*0.73,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(3),
                                                        color: AppColors.gray),
                                                    child: Padding(
                                                      padding: const EdgeInsets.symmetric(
                                                          vertical: 3, horizontal: 5),
                                                      child: Text(
                                                        '${filterProvider.filterList[index].duration}',
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight: FontWeight.w600,
                                                            color: AppColors.darkPurple),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                        '${filterProvider.filterList[index].range}',
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight: FontWeight.w600,
                                                            color: AppColors.darkPurple),
                                                      ),
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
                          }),
                    ),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import '../Common/AppColor.dart';
import '../Route/RouteName.dart';
import '../widget/RoundButton.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import '../widget/resumer_container.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class JobDetailsSkillsRequred extends StatelessWidget {
  dynamic data;
  JobDetailsSkillsRequred({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
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
                      Icon(Icons.arrow_back_rounded,
                          color: AppColors.darkPurple),
                    ],
                  ),
                  SizedBox(
                    height: media.height * 0.01,
                  ),
                  Divider(
                    color: AppColors.darkPurple,
                    thickness: 1,
                  ),
                  SizedBox(height: media.height * 0.02),
                  Row(
                    children: [
                      Container(
                        height: media.height * 0.1,
                        width: media.width * 0.22,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: data.color),
                      ),
                      SizedBox(width: media.width * 0.02),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${data.title}',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: AppColors.darkPurple),
                          ),
                          SizedBox(height: media.height * 0.01),
                          Text(
                            'Company name',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.darkPurple),
                          ),
                          SizedBox(height: media.height * 0.01),
                          Text(
                            '${data.loc}',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.darkPurple),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: media.height * 0.015),
                ],
              ),
            ),
            LinearProgressIndicator(
              value: 0.4,
              backgroundColor: Colors.grey,
              color: AppColors.darkPurple,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: media.height * 0.02,
                      ),
                      Text(
                        'Add a Resume for the Employer',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.darkPurple),
                      ),
                      SizedBox(
                        height: media.height * 0.025,
                      ),
                      ResumeContainer(
                        media: media,
                        title: 'Upload Resume',
                      ),
                      SizedBox(
                        height: media.height * 0.025,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: media.height * 0.0015,
                            width: media.width * 0.43,
                            decoration:
                                BoxDecoration(color: AppColors.darkPurple),
                          ),
                          Text('or'),
                          Container(
                            height: media.height * 0.0015,
                            width: media.width * 0.43,
                            decoration:
                                BoxDecoration(color: AppColors.darkPurple),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: media.height * 0.025,
                      ),
                      ResumeContainer(
                        media: media,
                        title: 'Build Your Resume',
                      ),
                      SizedBox(
                        height: media.height * 0.025,
                      ),
                      ResumeContainer(
                        media: media,
                        title: 'Build Your Resume',
                      ),
                             SizedBox(
                        height: media.height * 0.23,
                      ),
                      Row(
                        children: [Text('Having an issue with this application ?',style: TextStyle(
                          color: Colors.grey.shade500,
                        ),),
                        TextButton(onPressed: (){}, child: Text('Tell us more')),
                        
                        
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(child: RoundButton(title: 'Continue',onTap: (){
                            Navigator.of(context).pushNamed(RouteName.profile,
                        
                        );
                          },heights: media.height*0.08,))
                        ],
                      )
                    ]))
          ],
        ),
      ),
    );
  }
}

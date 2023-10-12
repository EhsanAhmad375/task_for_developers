import '../Common/AppColor.dart';
import '../Route/RouteName.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:country_picker/country_picker.dart';
import 'package:task_for_developers/widget/RoundButton.dart';
import 'package:task_for_developers/Screens/MyTextField.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:task_for_developers/Provider/filterProvider.dart';




class JobDetailDuties extends StatelessWidget {
  dynamic data;
  JobDetailDuties({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Consumer<FilterProvider>(
          builder: (context,filterProvider,child) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: media.height * 0.01,
                        ),
                        LinearProgressIndicator(value: 0.2,backgroundColor: Colors.grey,color: AppColors.darkPurple,),
                        SizedBox(
                          height: media.height * 0.01,
                        ),
                        Text(
                          'Add Your contact Information',
                          style: TextStyle(
                              color: AppColors.darkPurple,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: media.height * 0.015,
                        ),
                        Text(
                          'FullName',
                          style: TextStyle(color: AppColors.darkPurple),
                        ),
                        SizedBox(
                          height: media.height * 0.01,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: AppColors.darkPurple)),
                          child: MyTextField(
                            hint: 'Full Name',
                          ),
                        ),
                        SizedBox(
                          height: media.height * 0.015,
                        ),
                        Text(
                          'Email',
                          style: TextStyle(color: AppColors.darkPurple),
                        ),
                        SizedBox(
                          height: media.height * 0.01,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: AppColors.darkPurple)),
                          child: MyTextField(
                            hint: 'City,Country',
                          ),
                        ),
                        SizedBox(
                          height: media.height * 0.015,
                        ),
                        Text(
                          'City,Country',
                          style: TextStyle(color: AppColors.darkPurple),
                        ),
                        SizedBox(
                          height: media.height * 0.01,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: AppColors.darkPurple)),
                          child: MyTextField(
                            hint: 'City,Country',
                          ),
                        ),
                        SizedBox(
                          height: media.height * 0.015,
                        ),
                        Text(
                          'Phone Number',
                          style: TextStyle(color: AppColors.darkPurple),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                showCountryPicker(
                                  context: context,
                                  showPhoneCode: true,
                                  onSelect: (Country country) {
                                    print('Select country: ${country.displayName}');
                                    filterProvider.codePick(country.phoneCode);
                                    filterProvider.flagPick(country.flagEmoji);
                                  },
                                );
                              },
                              child: Container(
                                height: media.height * 0.06,
                                width: media.width * 0.25,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: media.width * 0.0035,
                                        color: AppColors.darkPurple)),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text("${filterProvider.flag}",style: TextStyle(
                                                fontSize: 20
                                              ),),
                                              SizedBox(width: media.width*0.02,),
                                              Text("+${filterProvider.code}"),
                                              SizedBox(width: media.width*0.02,),
                                              SvgPicture.asset('asset/Group 22.svg',color: AppColors.darkPurple,height: media.height*0.03,)
                                            ],
                                          ),
                                        ),
                              ),
                            ),
                            SizedBox(
                              width: media.width * 0.02,
                            ),
                            Container(
                              width:media.width*0.67 ,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: AppColors.darkPurple)),
                              child: MyTextField(
                                hint: 'Phone Number',
                              ),
                            ),
                          ],
                        ),
                          SizedBox(
                          height: media.height * 0.1,
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
                              Navigator.of(context).pushNamed(RouteName.jobDetailsSkillsRequred,
                          arguments:data
                          );
                            },heights: media.height*0.08,))
                          ],
                        )
                      ],
                    ),
                  ),
            
                ],
              ),
            );
          }
        ),
      ),
    );
  }

  double _sliderValue = 0.5;
}

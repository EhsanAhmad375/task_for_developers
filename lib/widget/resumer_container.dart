import '../Common/AppColor.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/cupertino.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first



class ResumeContainer extends StatelessWidget {
  String title;
  ResumeContainer({
    Key? key,
    required this.title,
    required this.media,
  }) : super(key: key);

  final Size media;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: media.height*0.055,
      width: media.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.darkPurple
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('$title',style: TextStyle(
          fontSize: 15,fontWeight: FontWeight.w600,
          color: AppColors.darkPurple
        ),),
        SizedBox(width: media.width*0.03,),
        SvgPicture.asset('asset/Document Medicine.svg',height: media.height*0.03,)
        ],
      ),
    );
  }
}

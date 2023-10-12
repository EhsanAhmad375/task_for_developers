import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:task_for_developers/Common/AppColor.dart';
import 'package:get/get.dart'; // Make sure you have 'get' package imported
// ignore_for_file: public_member_api_docs, sort_constructors_first

class RoundButton extends StatelessWidget {
  String? title;
  double? heights, widths; // Use double for size properties
  VoidCallback? onTap;

  RoundButton({
    Key? key,
    this.title,
    this.onTap,
    this.heights,
    this.widths,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: heights,
      minWidth: widths,
      color: AppColors.darkPurple,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      onPressed: onTap,
      child: Text(
        '$title',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400, color: AppColors.white),
      ),
    );
  }
}

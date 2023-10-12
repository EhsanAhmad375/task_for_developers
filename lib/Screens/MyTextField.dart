import '../Common/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class MyTextField extends StatelessWidget {
  String? hint;
  TextEditingController? textEditingController;
  bool isPrefix;
  bool isSuffix;
  IconData? prefixIcons;
  IconData? suffixIcons;
  FormFieldValidator<String>? validator;
  ValueChanged<String>? onChanged; // Add this line for onChanged

  MyTextField({
    Key? key,
    this.hint,
    this.textEditingController,
    this.prefixIcons,
    this.suffixIcons,
    this.isPrefix = false,
    this.isSuffix = false,
    this.validator,
    this.onChanged, 
     isSufix, // Add this line for onChanged
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: '$hint',
        // labelText: '$hint',
        hintStyle: TextStyle(
          fontWeight: FontWeight.w500
        ),
        filled: true,
        fillColor: AppColors.white,
        // labelText: '$hint',
        
        prefixIcon: isPrefix ? Icon(prefixIcons,size: 30,) : null,
        suffixIcon: isSuffix ? Icon(suffixIcons) : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
        // border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 15)
        
      ),
        
      validator: validator,
      onChanged: onChanged, // Set the onChanged callback
    );
  }
}

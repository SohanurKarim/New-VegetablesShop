import 'package:flutter/material.dart';
import 'package:foodtest0/config/color.dart';

class CustomTextField extends StatelessWidget {

 // final TextEditingController controller;
  final String labText;
 // final TextInputType keyboardType;

  CustomTextField({
     //required this.controller,
     required this.labText,
    // required this.keyboardType,
});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: primaryColor,
     // keyboardType: keyboardType,
    //  controller: controller,
      decoration:InputDecoration(
        labelText: labText,
        labelStyle: TextStyle(
          color: primaryColor,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: primaryColor),
        ),
      ),
    );
  }
}

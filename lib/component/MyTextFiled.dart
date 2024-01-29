import 'package:flutter/material.dart';
import 'package:zib/common/ThemeColors.dart';

class MyTextFiled extends StatelessWidget {
  const MyTextFiled({required this.onChange, this.hintText, super.key});

  final ValueChanged onChange;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 1,
      onChanged: onChange,
      cursorColor: ThemeColors.primaryTextColor,
      style: const TextStyle(backgroundColor: Colors.transparent),
      decoration: InputDecoration(
        hintText: hintText,
        // hintStyle: TextStyle(color: ThemeColors.nativeColor),
        // border: InputBorder.none
      ),
      controller: TextEditingController(),
    );
  }
}

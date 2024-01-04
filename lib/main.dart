import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zib/pages/HomePage.dart';

void main() {
  runApp(const GetMaterialApp(
    //材质小组件包裹防止某些小部件报错 比如InkWell
    home: Material(
      //包裹语言习惯排列方向的小部件，防止Text报错，
        child: Directionality(
            textDirection: TextDirection.ltr, child: HomePage())),
  ));
}

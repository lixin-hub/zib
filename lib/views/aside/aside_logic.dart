import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AsideLogic extends GetxController {
  var isOpen = true.obs;
  final items = <Widget>[];

  //first-level menu
  final itemList = [
    {"iconData": Icons.explore, "title": "Explore"},
    {"iconData": Icons.highlight, "title": "Highlights"},
    {"iconData": Icons.follow_the_signs, "title": "Following"}
  ];

  toggleAside() {
    isOpen.value = !isOpen.value;
  }
}

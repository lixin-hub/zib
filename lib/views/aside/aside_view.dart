import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import '../../common/ThemeColors.dart';
import '../../component/MenuItem.dart';
import 'aside_logic.dart';

class Aside extends StatefulWidget {
  const Aside({super.key});

  @override
  State<Aside> createState() => _AsideState();
}

class _AsideState extends State<Aside> {
  final logic = Get.put(AsideLogic());

  // current selected Index
  var _selectedIndex = 0;

  //reuse divider
  var divider = SizedBox(
      height: 24, child: Divider(height: 1, color: ThemeColors.nativeColor));

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    var maxWidth = min(max(screenWidth * 0.25, 170.0), 275.0);
    if (screenWidth < 500) {
      if (logic.isOpen.value) {
        logic.isOpen.value = false;
      }
    }
    if (screenWidth >= 500) {
      if (!logic.isOpen.value) {
        logic.isOpen.value = true;
      }
    }

    logic.items.clear();
    for (var i = 0; i < logic.itemList.length; i++) {
      var {"title": title, "iconData": iconData} = logic.itemList[i];
      logic.items.add(MenuItem(
        onTap: () => setState(() {
          _selectedIndex = i;
          if(i==1){
            // Get.toNamed("/highlight");
          }
        }),
        itemData: MenuItemData(iconData as IconData, title as String),
        isSelected: i == _selectedIndex,
      ).padding(vertical: 6));
    }
    //add divider
    logic.items.add(divider);
    return Obx(() => Container(
          color: ThemeColors.asideBackgroundColor,
          child: Column(
            children: [
              //title
              const Text("BULLY.COM", maxLines: 1)
                  .fontSize(20)
                  .textStyle(TextStyle(color: ThemeColors.primaryTextColor))
                  .alignment(Alignment.centerLeft)
                  .padding(left: 24),
              //first menu
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: logic.items,
              ).padding(top: 16, bottom: 32, horizontal: 24),

              //second Title
              const Text("Group", maxLines: 1)
                  .fontSize(20)
                  .textStyle(TextStyle(color: ThemeColors.primaryTextColor))
                  .fontWeight(FontWeight.w800)
                  .alignment(Alignment.centerLeft)
                  .padding(left: 24),
              const Column(
                children: [],
              )
            ],
          ),
        )
            .constrained(
                width: logic.isOpen.value ? maxWidth : 0, animate: true)
            .animate(const Duration(milliseconds: 200), Curves.linear));
  }

  @override
  void dispose() {
    Get.delete<AsideLogic>();
    super.dispose();
  }
}

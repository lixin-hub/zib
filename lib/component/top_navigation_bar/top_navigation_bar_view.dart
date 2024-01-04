import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zib/common/ThemeColors.dart';
import 'package:zib/component/top_navigation_bar/top_navigation_bar_logic.dart';

import '../../views/aside/aside_logic.dart';

class TopNavigationBar extends StatefulWidget {
  TopNavigationBar({Key? key}) : super(key: key);

  @override
  State<TopNavigationBar> createState() => _TopNavigationBarState();
}

class _TopNavigationBarState extends State<TopNavigationBar> {
  TextEditingController controller = TextEditingController();

  final logic = Get.put(TopNavigationBarLogic());
  final aside = Get.put(AsideLogic());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      alignment: Alignment.centerLeft,
      height: 84,
      color: ThemeColors.topBarColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // 左边
          Row(
            children: [
              IconButton(
                color: ThemeColors.primaryTextColor,
                onPressed: () {
                  aside.toggleAside();
                },
                icon: const Icon(Icons.menu),
              ),
              Text("BULLY.com",
                      style: TextStyle(color: ThemeColors.primaryTextColor))
                  .padding(horizontal: 12),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: ThemeColors.searchBackgroundColor,
                ),
                child: Row(
                    // mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    // crossAxisAlignment:CrossAxisAlignment.stretch,
                    children: [
                      Icon(Icons.search,
                              color: ThemeColors.primaryTextColor, size: 14)
                          .marginOnly(left: 12, right: 12),
                      Center(
                        child: TextField(
                          maxLines: 1,
                          cursorColor: ThemeColors.primaryTextColor,
                          style: TextStyle(
                              color: ThemeColors.primaryTextColor,
                              backgroundColor: Colors.transparent),
                          decoration: InputDecoration(
                              hintText: 'Search for something',
                              hintStyle:
                                  TextStyle(color: ThemeColors.nativeColor),
                              border: InputBorder.none),
                          controller: controller,
                        ),
                      ).expanded(),
                      // Text("Search for something",style: TextStyle(color: ThemeColors.secondaryTextColor),
                    ]),
              ).expanded(),
            ],
          ).expanded(flex: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.message, color: ThemeColors.primaryTextColor)
                  .marginOnly(right: 12),
              Icon(Icons.person, color: ThemeColors.primaryTextColor)
                  .marginOnly(right: 12),
              Icon(Icons.nightlight, color: ThemeColors.primaryTextColor)
            ],
          ).marginOnly(left: 12).expanded(flex: 0)
        ],
      ),
    );
  }
}

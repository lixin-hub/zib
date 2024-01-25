import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zib/common/ThemeColors.dart';
import 'package:zib/component/NeuButton.dart';

import '../views/aside/aside_logic.dart';

class TopNavigationBar extends StatefulWidget {
  const TopNavigationBar({super.key});

  @override
  State<TopNavigationBar> createState() => _TopNavigationBarState();
}

class _TopNavigationBarState extends State<TopNavigationBar> {
  TextEditingController controller = TextEditingController();
  final aside = Get.put(AsideLogic());
  final zoomDrawerController = Get.find<ZoomDrawerController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      alignment: Alignment.centerLeft,
      height: 84,
      color: ThemeColors.searchBackgroundColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // 左边
          Row(
            children: [
              NeuButton(
                  child: const Icon(Icons.menu),
                  onTap: () {
                    zoomDrawerController.toggle?.call();
                  }),
              Text("BULLY.com", style: TextStyle(color: ThemeColors.primaryTextColor))
                  .padding(horizontal: 12),
              NeuButton(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: ThemeColors.searchBackgroundColor,
                  ),
                  child: Row(
                      // mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      // crossAxisAlignment:CrossAxisAlignment.stretch,
                      children: [
                        Icon(Icons.search, color: ThemeColors.primaryTextColor, size: 14)
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
                                hintStyle: TextStyle(color: ThemeColors.nativeColor),
                                border: InputBorder.none),
                            controller: controller,
                          ),
                        ).expanded(),
                        // Text("Search for something",style: TextStyle(color: ThemeColors.secondaryTextColor),
                      ]),
                ),
              ).expanded(),
            ],
          ).expanded(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              NeuButton(
                child: const Icon(Icons.message),
                onTap: () {},
              ),
              NeuButton(
                  onTap: () {
                    Get.toNamed("/management");
                  },
                  child: const Icon(Icons.person)),
              NeuButton(
                child: const Icon(Icons.nightlight),
                onTap: () {},
              )
            ],
          ).marginOnly(left: 12).expanded(flex: 0)
        ],
      ),
    );
  }
}

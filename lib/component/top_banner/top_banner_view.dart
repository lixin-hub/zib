import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zib/common/ThemeColors.dart';

import '../top_navigation_bar/top_navigation_bar_view.dart';
import 'top_banner_logic.dart';

class TopBanner extends StatelessWidget {
  TopBanner({super.key});

  final logic = Get.put(TopBannerLogic());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "images/banner.png",
          width: double.infinity,
          height: 250,
          fit: BoxFit.cover,
        ),
        Positioned.fill(
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(),
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("物理速成,不是梦！",
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.w800,
                          color: ThemeColors.primaryTextColor)),
                  Text("风萧萧兮易水寒，壮士一去兮不复还。",
                          style:
                              TextStyle(color: ThemeColors.secondaryTextColor))
                      .marginOnly(bottom: 12),
                  ElevatedButton(onPressed: () {
                    Get.toNamed('/webview');
                  }, child: const Text("Go!"))
                ]).marginOnly(bottom: 30, left: 24),
          ),
        ),
        const TopNavigationBar(),
      ],
    );
  }
}

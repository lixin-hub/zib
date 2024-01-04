import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zib/common/ThemeColors.dart';
import 'package:zib/component/top_banner/top_banner_view.dart';
import 'package:zib/views/aside/aside_logic.dart';

import 'main_central_logic.dart';

class MainCentral extends StatelessWidget {
  MainCentral({Key? key}) : super(key: key);

  final logic = Get.put(MainCentralLogic());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: ThemeColors.mainCentralColor),
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          TopBanner(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zib/common/ThemeColors.dart';
import 'package:zib/component/CategoryRegin.dart';
import 'package:zib/component/TopBanner.dart';

import 'main_central_logic.dart';

class MainCentral extends StatelessWidget {
  MainCentral({super.key});

  final logic = Get.put(MainCentralLogic());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: ThemeColors.mainCentralColor),
      alignment: Alignment.topCenter,
      child: Column(children: [
        const TopBanner().marginOnly(bottom: 24),
        ListView(
          scrollDirection: Axis.vertical,
          children: [
            const CategoryRegin().marginSymmetric(horizontal: 12),
            const CategoryRegin().marginSymmetric(horizontal: 12),
            const CategoryRegin().marginSymmetric(horizontal: 12),
          ],
        ).expanded()
      ]),
    );
  }
}

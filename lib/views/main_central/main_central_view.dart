import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zib/common/ThemeColors.dart';
import 'package:zib/component/category_regin/category_regin_view.dart';
import 'package:zib/component/top_banner/top_banner_view.dart';

import 'main_central_logic.dart';

class MainCentral extends StatelessWidget {
  MainCentral({Key? key}) : super(key: key);

  final logic = Get.put(MainCentralLogic());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: ThemeColors.mainCentralColor),
      alignment: Alignment.topCenter,
      child: Column(children: [
        TopBanner().marginOnly(bottom: 24),
        ListView(
          scrollDirection: Axis.vertical,
          children: [
            CategoryRegin().marginSymmetric(horizontal: 12),
            CategoryRegin().marginSymmetric(horizontal: 12),
            CategoryRegin().marginSymmetric(horizontal: 12),
          ],
        ).expanded()
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zib/common/ThemeColors.dart';

import '../CardItem.dart';
import 'category_regin_logic.dart';

class CategoryRegin extends StatelessWidget {
  CategoryRegin({Key? key}) : super(key: key);

  final logic = Get.put(CategoryReginLogic());

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _category().marginOnly(bottom: 24),
      _cardList().marginOnly(bottom: 24)
    ]);
  }
}

Widget _cardList() {

  return SizedBox(
    height: 280,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: 10,
      controller: ScrollController(),
      itemBuilder: (context, index) {
        var item = index != 10
            ? const CardItem().marginOnly(left: 12)
            : const CardItem();
        return item;
      },
    ),
  );
}

//
Widget _category() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text("时下流行",
              style: TextStyle(
                  color: ThemeColors.primaryTextColor,
                  fontSize: 32,
                  fontWeight: FontWeight.w700))
          .marginOnly(right: 12),
      OutlinedButton(
        style: ButtonStyle(
          alignment: Alignment.center,
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            return states.contains(MaterialState.hovered)
                ? ThemeColors.selectedColor
                : ThemeColors.mainCentralColor;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0), // 设置圆角半径
          )),
          side: MaterialStateProperty.all(
              BorderSide(color: ThemeColors.selectedColor, width: 1.5)),
          // 这里设置边框颜色为红色
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 5, horizontal: 24)),
        ),
        onPressed: () {},
        child: Text("全部",
            style:
                TextStyle(color: ThemeColors.secondaryTextColor, fontSize: 12)),
      ).constrained(height: 25)
    ],
  );
}

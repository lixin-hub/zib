import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zib/api/home_page.dart';
import 'package:zib/common/ThemeColors.dart';
import 'package:zib/component/RefreshButton.dart';

import 'CardItem.dart';

class CategoryRegin extends StatefulWidget {
  final String reginTitle;
  final Map<String, dynamic> params;

  const CategoryRegin(this.reginTitle, this.params, {super.key});

  @override
  State<CategoryRegin> createState() => _CategoryReginState();
}

class _CategoryReginState extends State<CategoryRegin> {
  List listData = [];

  void loadData() {
    recommendRoomList(widget.params).then((res) {
      if (res['rows'] != null) {
        setState(() {
          listData = res['rows'];
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [_category().marginOnly(bottom: 24), _cardList().marginOnly(bottom: 24)]);
  }

  Widget _cardList() {
    return SizedBox(
      height: 280,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: listData.length,
        controller: ScrollController(),
        itemBuilder: (context, index) {
          var item = CardItem(listData[index]);
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
        Text(widget.reginTitle,
                style: TextStyle(
                    color: ThemeColors.primaryTextColor, fontSize: 32, fontWeight: FontWeight.w700))
            .marginOnly(right: 12),
        OutlinedButton(
                style: ButtonStyle(
                  alignment: Alignment.center,
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    return states.contains(MaterialState.hovered)
                        ? ThemeColors.selectedColor
                        : ThemeColors.mainCentralColor;
                  }),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
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
                    style: TextStyle(color: ThemeColors.secondaryTextColor, fontSize: 12)))
            .constrained(height: 25),
        RefreshButton(() {
          loadData();
        }).marginOnly(left: 5)
      ],
    );
  }
}

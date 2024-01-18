import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zib/common/ThemeColors.dart';

class CardItem extends StatefulWidget {
  const CardItem({super.key});

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  var _isHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (e) {
        setState(() {
          _isHover = e;
        });
      },
      onTap: () {
        Get.toNamed('/player', arguments: ('1', '2'));
      },
      child: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                "images/card.jpg",
                fit: BoxFit.cover,
              ).aspectRatio(aspectRatio: 10 / 9),
            ),
            Text(
              "BBC记者深入报导日本地震灾区",
              maxLines: 1,
              style: TextStyle(
                  color: ThemeColors.primaryTextColor,
                  fontSize: 16,
                  overflow: TextOverflow.ellipsis),
            ),
            Text(
              "这场7.6级的地震，造成至少48人死亡。日本首相表示，政府目前正在与时间赛跑，救援幸存者。",
              maxLines: 1,
              style: TextStyle(
                  color: ThemeColors.secondaryTextColor,
                  fontSize: 10,
                  overflow: TextOverflow.ellipsis),
            ),
          ],
        ).constrained(width: 260),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
                color: _isHover ? ThemeColors.selectedColor.withOpacity(0.2) : Colors.transparent,
                borderRadius: BorderRadius.circular(5)),
            // width: 400,
          ),
        )
      ]),
    );
  }
}

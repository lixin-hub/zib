import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../common/ThemeColors.dart';

class CardDetail extends StatelessWidget {
  const CardDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:300,
      child: Stack(
        children: [
          GestureDetector(onTap: () {
          }),
          Align(
            alignment: Alignment.center,
            child: Stack(alignment: Alignment.center, children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
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
            ]),
          )
        ],
      ),
    );
  }
}

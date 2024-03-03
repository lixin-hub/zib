import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zib/api/user.dart';

import '../common/ThemeColors.dart';

class CardDetail extends StatefulWidget {
  final Map<String, dynamic> item;

  const CardDetail(this.item, {super.key});

  @override
  State<CardDetail> createState() => _CardDetailState();
}

class _CardDetailState extends State<CardDetail> {
  late var item;
  var mainSpeaker = {};

  @override
  void initState() {
    super.initState();
    item = widget.item;
    if (item['mainSpeaker'] == null) {
      return;
    }
    userInfoById(item['mainSpeaker']).then((res) {
      if (res['user'] != null) {
        setState(() {
          mainSpeaker = res['user'];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Stack(
        children: [
          //body
          Column(
            children: [
              //backgroun图像
              SizedBox(
                height: 150,
                child: Stack(
                  children: [
                    Image.asset(
                      "images/card.jpg",
                      fit: BoxFit.cover,
                      width: 300,
                    ),
                    //播放按钮
                    Align(
                      alignment: Alignment.center,
                      child: IconButton(
                        hoverColor: Colors.grey.withOpacity(0.5),
                        color: Colors.white.withOpacity(0.8),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black.withOpacity(0.3))),
                        iconSize: 30,
                        icon: const Icon(Icons.play_arrow),
                        onPressed: () {
                          Get.toNamed("player",arguments: item);
                        },
                      ),
                    ),
                    //返回按钮
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        iconSize: 25,
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                  ],
                ).backgroundColor(Colors.red),
              ),
              //body 内容
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(top: 35, left: 10, right: 10),
                  color: const Color(0xff292B2F),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //发布者
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            mainSpeaker['nickName'] ?? '',
                            style: TextStyle(
                                fontSize: 18,
                                color: ThemeColors.primaryTextColor,
                                fontWeight: FontWeight.w500),
                          ).marginOnly(right: 5),
                          const Icon(
                            Icons.auto_fix_high,
                            color: ThemeColors.contentColorGreen,
                            size: 16,
                          )
                        ],
                      ).marginOnly(bottom: 6),
                      //详情
                      Text(
                        item['titles'] ?? '',
                        maxLines: 1,
                        style: TextStyle(
                            color: ThemeColors.primaryTextColor,
                            fontSize: 16,
                            overflow: TextOverflow.ellipsis),
                      ).marginOnly(bottom: 5),
                      Text(
                        item['introduction'] ?? '',
                        style: TextStyle(color: ThemeColors.secondaryTextColor, fontSize: 10),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          //头像
          Positioned(
            top: 120,
            left: 10,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Container(
                decoration: BoxDecoration(color: const Color(0xff292B2F), boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.8), // 阴影颜色
                    spreadRadius: 5, // 阴影扩散程度
                    blurRadius: 10, // 阴影模糊程度
                    offset: const Offset(0, 3), // 阴影偏移量，可以调整阴影的方向
                  )
                ]),
                padding: const EdgeInsets.all(5),
                child: const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("images/banner.png"),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

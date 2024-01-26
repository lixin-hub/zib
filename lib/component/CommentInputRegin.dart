import 'package:animated_neumorphic/animated_neumorphic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zib/common/ThemeColors.dart';
import 'package:zib/component/NeuButton.dart';

class CommentInputRegin extends StatefulWidget {
  const CommentInputRegin({super.key});

  @override
  State<CommentInputRegin> createState() => _CommentInputReginState();
}

class _CommentInputReginState extends State<CommentInputRegin> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //tool bar
          const AnimatedNeumorphicContainer(
            depth: 1.0,
            color: ThemeColors.backgroundColor,
            height: 3,
          ).marginSymmetric(vertical: 10),
          const SizedBox(height: 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  NeuButton(
                      color: ThemeColors.backgroundColor,
                      onTap: () {},
                      child: const Icon(
                        Icons.color_lens,
                        color: ThemeColors.menuTextColor,
                      )),
                  NeuButton(
                      color: ThemeColors.backgroundColor,
                      onTap: () {},
                      child: const Icon(
                        Icons.margin_rounded,
                        color: ThemeColors.menuTextColor,
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  NeuButton(
                      color: ThemeColors.backgroundColor,
                      onTap: () {},
                      child: const Icon(
                        Icons.mail,
                        color: ThemeColors.menuTextColor,
                      )),
                ],
              ).expanded()
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              AnimatedNeumorphicContainer(
                depth: 1.0,
                color: ThemeColors.backgroundColor,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    maxLines: 2,
                    // cursorWidth: 5,
                    // cursorHeight: 20,
                    cursorColor: ThemeColors.menuTextColor,
                    style: const TextStyle(
                      color: ThemeColors.menuTextColor,
                    ),
                    decoration: const InputDecoration(
                        hintText: '发个弹幕呗!',
                        hintStyle: TextStyle(
                          // color: Colors.white
                          color: ThemeColors.menuTextColor,
                        ), // hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none),
                    controller: textEditingController,
                  ),
                ),
              ).marginSymmetric(vertical: 10, horizontal: 10).expanded(),
            ],
          ).padding(bottom: 5),
          Align(
              alignment: Alignment.centerRight,
              child: NeuButton(
                  width: 80,
                  height: 40,
                  color: ThemeColors.backgroundColor,
                  // style: ButtonStyle(
                  //   shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(5.0), // 设置圆角半径
                  //   )),
                  // ),
                  onTap: () {},
                  child: const Text(
                    "发送",
                    style: TextStyle(
                      color: ThemeColors.menuTextColor,
                    ),
                  )))
        ],
      ),
    ).backgroundColor(
      ThemeColors.backgroundColor,
    );
  }
}

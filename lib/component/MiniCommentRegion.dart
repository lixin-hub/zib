import 'package:animated_neumorphic/animated_neumorphic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zib/common/ThemeColors.dart';
import 'package:zib/component/video_review/video_review_logic.dart';
import 'package:zib/main.dart';
import 'package:zib/pages/player_page/player_page_logic.dart';

class MiniCommentRegin extends StatefulWidget {
  const MiniCommentRegin({super.key});

  @override
  State<MiniCommentRegin> createState() => _MiniCommentReginState();
}

class _MiniCommentReginState extends State<MiniCommentRegin> {
  TextEditingController textEditingController = TextEditingController();
  final reviewLogic = Get.put(VideoReviewLogic());
  final playerPageLogic = Get.find<PlayerPageLogic>();
  late final String liveRoomId;

  @override
  void initState() {
    super.initState();
    liveRoomId = playerPageLogic.liveRoomId;
    // textEditingController.addListener(() {
    //   // var value=textEditingController.value.text;
    //   // logger.i(value);
    // });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          //输入框
          Align(
            alignment: Alignment.center,
            child: AnimatedNeumorphicContainer(
              depth: 1.0,
              color: ThemeColors.backgroundColor,
              child: Container(
                padding: const EdgeInsets.only(left: 35, right: 100),
                child: TextField(
                  maxLines: 1,
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
            ),
          ),
          //颜色图标
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: const Icon(
                Icons.color_lens,
                color: ThemeColors.menuTextColor,
              ),
              onPressed: () {},
            ),
          ),
          //发送按钮
          Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                // width: 80,
                // height: 40,
                color: ThemeColors.backgroundColor,
                onPressed: () {
                  var value = textEditingController.value.text;
                  reviewLogic.pushComment(liveRoomId, value);
                  textEditingController.clear();
                  logger.i('评论：$value');
                },
                icon: const Icon(Icons.send,color: ThemeColors.contentColorWhite,),
              ))
        ],
      ),
    );
  }
}

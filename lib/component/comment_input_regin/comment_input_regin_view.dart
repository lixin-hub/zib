import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:window_manager/window_manager.dart';
import 'comment_input_regin_logic.dart';

class CommentInputRegin extends StatefulWidget {
  const CommentInputRegin({super.key});

  @override
  State<CommentInputRegin> createState() => _CommentInputReginState();
}

class _CommentInputReginState extends State<CommentInputRegin> {
  final logic = Get.put(CommentInputReginLogic());

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //tool bar
          const Divider(color: Colors.white,indent: 10,endIndent: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.color_lens)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.margin_rounded)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.mail)),
                ],
              ),
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.color_lens)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.margin_rounded)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.mail)),
                ],
              )
            ],
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                color: const Color(0xff46454A),
                child: TextField(
                  maxLines: 2,
                  cursorWidth: 1,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                      hintText: '发个弹幕呗!',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none),
                  controller: textEditingController,
                ),
              ).expanded(),
            ],
          ).padding(bottom: 5),
          Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0), // 设置圆角半径
                    )),
                  ),
                  onPressed: () {

                  },
                  child: const Text("发送")))
        ],
      ),
    );
  }
}

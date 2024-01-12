import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zib/component/CommentItem.dart';
import 'package:zib/component/UserRank.dart';
import 'package:zib/component/comment_input_regin/comment_input_regin_view.dart';

import 'video_review_logic.dart';

class VideoReview extends StatefulWidget {
  const VideoReview({super.key});

  @override
  State<VideoReview> createState() => _VideoReviewState();
}

class _VideoReviewState extends State<VideoReview> {
  final logic = Get.put(VideoReviewLogic());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    BorderRadius borderRadius = BorderRadius.zero;
    if (width > 700) {
      borderRadius =
          const BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20));
    }

    return Column(
      children: [
        //用户区
        Container(
          decoration: BoxDecoration(borderRadius: borderRadius, color: const Color(0xff294F7E)),
          constraints: const BoxConstraints(maxHeight: 120),
          child: const UserRank(),
        ),
        //评论区
        Container(
            width: double.infinity,
            decoration: const BoxDecoration(color: Colors.white),
            child: Container(
              width: 10,
              // constraints: const BoxConstraints(maxWidth: 100),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
              child: Row(
                children: [
                  Obx(() {
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: logic.list.length,
                      controller: logic.scrollController,
                      itemBuilder: (context, index) {
                        return CommentItem("大红红的美食", logic.list[index]);
                      },
                    );
                  }).expanded(flex: 10),
                  const Expanded(flex: 1, child: SizedBox())
                ],
              ),
            )).expanded(),
        //输入区
        Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
              color: Color(0xff294F7E)),
          constraints: const BoxConstraints(maxHeight: 150),
          child: const CommentInputRegin(),
        ),
      ],
    );
  }
}

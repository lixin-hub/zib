import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zib/common/ThemeColors.dart';
import 'package:zib/component/CommentInputRegin.dart';
import 'package:zib/component/CommentItem.dart';

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
        //评论区
        Container(
          color: ThemeColors.backgroundColor,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Obx(() {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: logic.list.length,
              controller: logic.scrollController,
              itemBuilder: (context, index) {
                return CommentItem("大红红的美食", logic.list[index])
                    .marginOnly(top: 10, bottom: 10, left: 10);
              },
            );
          }).expanded(),
        ).expanded(),
        //输入区
        const CommentInputRegin(),
      ],
    );
  }
}

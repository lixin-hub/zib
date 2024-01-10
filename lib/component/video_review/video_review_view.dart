import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zib/component/CommentItem.dart';

import 'video_review_logic.dart';

class VideoReview extends StatelessWidget {
  VideoReview({super.key});

  final logic = Get.put(VideoReviewLogic());

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.black54),
        child: Container(
          width: 10,
          // constraints: const BoxConstraints(maxWidth: 100),
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return CommentItem("大红红的美食", "评论 " * ((index + 1) % 30));
                  },
                ),
              ).expanded(flex: 8),
              Container().expanded(flex: 2)
            ],
          ),
        ));
  }
}

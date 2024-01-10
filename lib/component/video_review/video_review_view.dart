
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zib/component/CommentItem.dart';

import 'video_review_logic.dart';

class VideoReview extends StatelessWidget {
  VideoReview({Key? key}) : super(key: key);

  final logic = Get.put(VideoReviewLogic());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(color: Colors.black54),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 20,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return  CommentItem("大红红的美食", "评论 " * ((index + 1) % 30));
        },
      ),
    );
  }
}

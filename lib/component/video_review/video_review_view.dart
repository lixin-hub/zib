import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
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
    return Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.black54),
        child: Container(
          width: 10,
          // constraints: const BoxConstraints(maxWidth: 100),
          padding: const EdgeInsets.all(20),
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
              }).expanded(flex: 8),
              const Expanded(flex: 2, child: SizedBox())
            ],
          ),
        ));
  }
}

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:zib/main.dart';

import '../../api/video_comment.dart';

class VideoReviewLogic extends GetxController {
  final list = <String>[].obs;
  late final ScrollController scrollController = ScrollController();
  Timer? timer;

  @override
  void onReady() {
    // int count = 0;
    // timer = Timer.periodic(const Duration(milliseconds: 1000), (t) {
    //   list.add("评论：${count++}" * (count % 5));
    //   scrollController.animateTo(scrollController.position.maxScrollExtent, duration: const Duration(milliseconds: 300), curve: Curves.easeInOutSine);
    // });
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
    timer?.cancel();
  }

  //添加评论
  void pushComment(roomId,String value) {
    createVideoComment({
      'liveRoomId':roomId,
      'content': value}).then((value) {
      logger.e(value);
      list.value = [...list, value];
      // TODO 这里要优化
    });
  }
}

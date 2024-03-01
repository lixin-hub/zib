import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:zib/main.dart';
import 'package:zib/pages/player_page/player_page_logic.dart';

import '../../api/video_comment.dart';

class VideoReviewLogic extends GetxController {
  final list = <Map<String, dynamic>>[].obs;
  late final ScrollController scrollController = ScrollController();
  final playerPageLogic = Get.find<PlayerPageLogic>();
  Timer? timer;

  @override
  void onReady() {
    super.onReady();
    refreshComments();
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
    timer?.cancel();
  }

  //添加评论
  void pushComment(roomId, String value) {
    createVideoComment({'liveRoomId': roomId, 'content': value}).then((res) {
      list.value = [...list, res['data']];
      // TODO 这里要优化
      scrollToBottom();
    });
  }

  void refreshComments() {
    //查询前20条
    videoCommentList({
      'pageSize': 20,
      'orderByColumn': 'create_time',
      'isAsc': 'desc',
      'pageNum': 1,
      'liveRoomId': playerPageLogic.liveRoomId
    }).then((res) {
      // logger.e(res);
      List<Map<String, dynamic>> rows = List<Map<String, dynamic>>.from(res['rows']);
      if (rows.isEmpty) {
        return;
      }
      list.value = rows.reversed.toList();
      scrollToBottom();
    });
  }

  //滚动评论到底部
  void scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.animateTo(scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOutSine);
    });
  }
}

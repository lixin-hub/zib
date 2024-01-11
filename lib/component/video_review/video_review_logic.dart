import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class VideoReviewLogic extends GetxController {
  final list = <String>[].obs;
  late final ScrollController scrollController=ScrollController();
  late Timer timer;

  @override
  void onReady() {
    int count = 0;
    timer = Timer.periodic(const Duration(milliseconds: 1000), (t) {
      list.add("评论：${count++}"*(count%5));
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    });
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
    timer.cancel();
  }
}

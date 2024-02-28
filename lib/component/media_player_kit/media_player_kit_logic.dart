import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../common/TestingURLs.dart';
import '../../main.dart';

class MediaPlayerKitLogic extends GetxController {


//onInit 会先于onReady 和 initState执行，onReady会在initState后执行
  @override
  void onInit() {
    super.onInit();
    logger.i("_PlayerPageState init");

    // _controller.play();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

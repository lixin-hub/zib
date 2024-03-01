import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:zib/main.dart';

class PlayerPageLogic extends GetxController {
  late VideoPlayerController controller;
  late var isPlaying = false.obs;
  var liveRoomId;

  @override
  void onInit() {
    super.onInit();
    liveRoomId = Get.arguments;
    logger.i('player_init in roomId:$liveRoomId');
    if (liveRoomId == null) {
      Get.back();
      return;
    }
    controller = VideoPlayerController.networkUrl(
        Uri.parse('http://localhost:80/live.flv?port=1985&app=myapp&stream=$liveRoomId'));
    controller.addListener(() {
      isPlaying.value = controller.value.isPlaying;
    });
    controller.setLooping(true);
    controller.initialize();
  }

  @override
  void onClose() {
    super.onClose();
    logger.w('player_close');
    controller.dispose();
  }
}

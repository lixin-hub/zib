import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:zib/api/user.dart';
import 'package:zib/main.dart';

class PlayerPageLogic extends GetxController {
  late VideoPlayerController controller;
  late var isPlaying = false.obs;
  late var liveRoomId;
  late var mainSpeakerId;
  late var mainSpeakerInfo = {}.obs;
  late var liveRoomInfo = {}.obs;

  @override
  void onInit() {
    super.onInit();
    liveRoomInfo.value = Get.arguments;
    liveRoomId = liveRoomInfo.value['id'];
    mainSpeakerId = liveRoomInfo.value['mainSpeaker'];
    logger.i('player_init in roomId:$liveRoomId');
    if (liveRoomId == null) {
      Get.back();
      return;
    }
    var userId = store.user['userId'];
    controller = VideoPlayerController.networkUrl(Uri.parse(
        'http://localhost:80/live.flv?userId=$userId&port=1985&app=myapp&stream=$liveRoomId'));
    controller.addListener(() {
      isPlaying.value = controller.value.isPlaying;
    });
    controller.setLooping(true);
    controller.initialize();
    //获取主播信息
    userInfoById(mainSpeakerId).then((res) {
      if (res['user'] != null) {
        mainSpeakerInfo.value = res['user'];
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
    logger.w('player_close');
    controller.dispose();
  }
}

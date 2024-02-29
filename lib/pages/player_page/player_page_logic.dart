import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:zib/common/TestingURLs.dart';

class PlayerPageLogic extends GetxController {
  late VideoPlayerController controller;
  late var isPlaying = false.obs;

  var liveRoomId = '1760221328952004609';

  @override
  void onInit() {
    super.onInit();
    controller = VideoPlayerController.networkUrl(Uri.parse(FFmpeg));
    // Uri.parse("http://devimages.apple.com/iphone/samples/bipbop/gear1/prog_index.m3u8"));
    // Uri.parse("https://pull-flv-l1.douyincdn.com/game/stream-690873598648516661_or4.flv?abr_pts=-800&_session_id=037-202401101923126632A97451C5222F1699.1704885799941.88032"));
    // Uri.parse(
    //     "https://sf1-cdn-tos.huoshanstatic.com/obj/media-fe/xgplayer_doc_video/mp4/xgplayer-demo-360p.mp4"));
    controller.addListener(() {
      isPlaying.value = controller.value.isPlaying;
    });
    controller.setLooping(true);
    controller.initialize();
  }

  @override
  void onClose() {
    super.onClose();
    controller.dispose();
  }
}

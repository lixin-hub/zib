import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:zib/component/media_player_kit/media_player_kit_logic.dart';
import 'package:zib/component/media_player_kit/media_player_kit_view.dart';
import 'package:zib/views/DesktopPlayerPage.dart';
import 'package:zib/views/MobilePlayerPage.dart';

class PlayerPageLogic extends GetxController {
  late VideoPlayerController controller;
  late MobilePlayerPage mobilePlayerPage;
  late DesktopPlayerPage desktopPlayerPage;
  late MediaKitPlayer player;

  @override
  void onInit() {
    super.onInit();
    player = MediaKitPlayer();
    controller = Get.find<MediaPlayerKitLogic>().controller;
    controller.initialize().then((_) {
      // _controller.play();
    });
    mobilePlayerPage = MobilePlayerPage(player);
    desktopPlayerPage = DesktopPlayerPage(player);
  }

  @override
  void onClose() {
    controller.dispose();

    super.onClose();
  }
}

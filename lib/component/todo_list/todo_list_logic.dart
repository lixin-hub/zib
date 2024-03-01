import 'package:get/get.dart';
import 'package:zib/api/live.dart';

class TodoListLogic extends GetxController {
  var listData = [].obs;

  @override
  onInit() {
    super.onInit();
    reload();
  }

  Future<void> reload() async {
    var res = await liveRoomList({'status': 'not_start'});
    listData.value = res['rows'];
  }
}

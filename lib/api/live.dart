import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:zib/common/StoreController.dart';

StoreController controller = Get.find<StoreController>();
Dio dio = controller.dio;
//创建直播
createLiveRoom(params) async {
  final response = await dio.post("live/room/save", data: params);
  return response.data;
}

//获取用户信息
userInfoApi() async {
  final response = await dio.get("/sys/user/sysInfo");
  return response.data;
}

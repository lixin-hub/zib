import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:zib/common/StoreController.dart';

StoreController controller = Get.find<StoreController>();
Dio dio = controller.dio;

loginApi(username, password) async {
  final response =
      await dio.post("token/login", queryParameters: {"username": username, "password": password});

  return response.data;
}

//获取用户信息
userInfoApi() async {
  final response = await dio.get("/sys/user/sysInfo");
  return response.data;
}

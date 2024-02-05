import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:zib/common/StoreController.dart';

StoreController controller = Get.find<StoreController>();
Dio dio = controller.dio;

loginApi(username, password) async {
  final response = await dio.post("auth/login", data: {
    "tenantId": "000000",
    "username": username,
    "password": password,
    "rememberMe": false,
    "clientId": "e5cd7e4891bf95d1d19206ce24a7b32e",
    "grantType": "password"
  });

  return response.data['data'];
}

//获取用户信息
userInfoApi() async {
  final response = await dio.get("system/user/getInfo");
  return response.data['data'];
}

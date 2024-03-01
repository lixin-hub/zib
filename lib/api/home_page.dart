import 'package:dio/dio.dart';

import '../main.dart';

Dio dio = store.dio;

//直播间列表
recommendRoomList(Map<String, dynamic>? params) async {
  final response = await dio.get("home/list", queryParameters: params);
  return response.data;
}
import 'package:dio/dio.dart';

import '../main.dart';

Dio dio = store.dio;
//创建直播
createLiveRoom(params) async {
  final response = await dio.post("live/room", data: params);
  return response.data;
}

//删除直播间
deleteLiveRoom(id) async {
  final response = await dio.delete("live/room/$id");
  return response.data;
}

//更新直播间
updateRoom(params) async {
  final response = await dio.put("live/room", data: params);
  return response.data;
}

//直播间列表
liveRoomList(Map<String, dynamic>? params) async {
  final response = await dio.get("live/room/list", queryParameters: params);
  return response.data;
}

//根据id查询直播间
liveRoomInfo(id) async {
  final response = await dio.get("live/room/$id");
  return response.data;
}

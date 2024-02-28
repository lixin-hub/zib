import 'package:dio/dio.dart';

import '../main.dart';

Dio dio = store.dio;
//创建评论
createVideoComment(params) async {
  final response = await dio.post("live/comment", data: params);
  return response.data;
}

//删除
deleteVideoComment(id) async {
  final response = await dio.delete("live/comment/$id");
  return response.data;
}

//更新直
updateVideoComment(params) async {
  final response = await dio.put("live/comment", data: params);
  return response.data;
}

//列表
videoCommentList(Map<String, dynamic>? params) async {
  final response = await dio.get("live/comment/list", queryParameters: params);
  return response.data;
}

//根据id查询
videoCommentInfo(id) async {
  final response = await dio.get("live/comment/$id");
  return response.data;
}

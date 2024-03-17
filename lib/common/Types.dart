enum ToolbarCallbackType {
  BACK,
  REVIEW,
  USER_RANK,
  REFRESH;
}

enum EventType {
  //关闭评论区
  REVIEW_CLOSE,
  //打开评论区
  REVIEW_OPPEN,
  //刷新用户区
  USER_RANK_RESFREH,
  //更新在线用户数量
  ONLINE_NUMBER,
  NONE,
}

class EventPayload {
  final EventType type;
  final dynamic data; // 这里可以使用dynamic来传递不同类型的数据

  EventPayload({this.type = EventType.NONE, this.data});
}

typedef ToolbarCallback = void Function(ToolbarCallbackType callbackType);

enum ToolbarCallbackType {
  BACK,
  REVIEW,
  USER_RANK;
}

enum Events {
  //关闭评论区
  REVIEW_CLOSE,
  //打开评论区
  REVIEW_OPPEN,
}

typedef ToolbarCallback = void Function(ToolbarCallbackType callbackType);



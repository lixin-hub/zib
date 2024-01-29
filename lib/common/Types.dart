enum ToolbarCallbackType {
  BACK,
  REVIEW,
  USER_RANK;
}

typedef ToolbarCallback = void Function(ToolbarCallbackType callbackType);

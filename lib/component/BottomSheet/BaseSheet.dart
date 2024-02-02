import 'package:flutter/material.dart';

abstract class BaseSheet {
  Widget layout(BuildContext? context);

  WidgetBuilder getSheetBuilder() {
    return (BuildContext context) {
      return layout(context);
    };
  }
}

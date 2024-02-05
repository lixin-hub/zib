import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:video_player_media_kit/video_player_media_kit.dart';
import 'package:window_manager/window_manager.dart';
import 'package:zib/api/live.dart';
import 'package:zib/common/Sp.dart';
import 'package:zib/pages/HomePage.dart';
import 'package:zib/router/GetPages.dart';

import 'common/StoreController.dart';

//日志
var logger = Logger();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //初始化视频播放器插件
  VideoPlayerMediaKit.ensureInitialized(
      // macOS: true,
      // windows: true,
      web: true,
      linux: true,
      android: true);
  if (Platform.isLinux || Platform.isWindows) {
    //初始化窗口管理插件
    await windowManager.ensureInitialized();

    WindowOptions windowOptions = const WindowOptions(
      // size: Size(800, 600),
      minimumSize: Size(400, 800),
      // center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      // titleBarStyle: TitleBarStyle.hidden,
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
    // windowManager.addListener(MyWindowListener());
  }
  await SP.init();
  StoreController store = Get.put(StoreController());
  var token = SP.getString('token');
  var clientid = SP.getString('clientid');
  if (clientid.isNotEmpty) {
    store.clientid = clientid;
  }
  if (token.isNotEmpty) {
    store.token = token;
    await userInfoApi();
  }
  runApp(GetMaterialApp(
    darkTheme: ThemeData(
        cupertinoOverrideTheme: const CupertinoThemeData(
      textTheme: CupertinoTextThemeData(), // This is required
    )),
    theme: ThemeData(
      fontFamily: 'epilogue',
      iconTheme: const IconThemeData(
        color: Colors.white, // 设置图标颜色
        size: 24.0, // 设置图标大小
      ),
    ),

    debugShowCheckedModeBanner: false,
    //材质小组件包裹防止某些小部件报错 比如InkWell
    home: const Material(
        //包裹语言习惯排列方向的小部件，防止Text报错，
        child: Directionality(textDirection: TextDirection.ltr, child: HomePage())),
    initialRoute: store.token.isNotEmpty ? "/management" : "/login",
    getPages: pages,
    defaultTransition: Transition.cupertino,
  ));
}

class MyWindowListener extends WindowListener {
  @override
  void onWindowEnterFullScreen() {
    windowManager.setTitleBarStyle(TitleBarStyle.hidden);
  }

  @override
  void onWindowEvent(String eventName) {
    // print(eventName);
  }

  @override
  void onWindowFocus() {}

  @override
  void onWindowLeaveFullScreen() {
    windowManager.setTitleBarStyle(TitleBarStyle.normal);
  }

  @override
  void onWindowMaximize() {
    windowManager.setAsFrameless();
    windowManager.setTitleBarStyle(TitleBarStyle.hidden);
  }

  @override
  void onWindowMinimize() {
    windowManager.setTitleBarStyle(TitleBarStyle.normal);
  }

  @override
  void onWindowMove() {}

  @override
  void onWindowMoved() {
    windowManager.setTitleBarStyle(TitleBarStyle.normal);
  }

  @override
  void onWindowResize() {}

  @override
  void onWindowResized() {
    windowManager.setTitleBarStyle(TitleBarStyle.normal);
  }

  @override
  void onWindowRestore() {}

  @override
  void onWindowUndocked() {}

  @override
  void onWindowUnmaximize() {
    windowManager.setTitleBarStyle(TitleBarStyle.normal);
  }
}

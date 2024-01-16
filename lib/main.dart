import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:zib/pages/HomePage.dart';
import 'package:zib/router/GetPages.dart';
import 'package:video_player_media_kit/video_player_media_kit.dart';
import 'package:window_manager/window_manager.dart';

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
      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      // titleBarStyle: TitleBarStyle.hidden,
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    //材质小组件包裹防止某些小部件报错 比如InkWell
    home: const Material(
        //包裹语言习惯排列方向的小部件，防止Text报错，
        child: Directionality(textDirection: TextDirection.ltr, child: HomePage())),
    initialRoute: "/player",
    getPages: pages,
    defaultTransition: Transition.cupertino,
  ));
}

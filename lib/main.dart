import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zib/pages/HomePage.dart';
import 'package:zib/router/GetPages.dart';
import 'package:video_player_media_kit/video_player_media_kit.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  VideoPlayerMediaKit.ensureInitialized(
      // macOS: true,
      // windows: true,
      web: true,
      linux: true,
      android: true);
  runApp(
    GetMaterialApp(
      //材质小组件包裹防止某些小部件报错 比如InkWell
      home: const Material(
          //包裹语言习惯排列方向的小部件，防止Text报错，
          child: Directionality(
              textDirection: TextDirection.ltr, child: HomePage())),
      initialRoute: "/",
      getPages: pages,
      defaultTransition: Transition.cupertino,
    ),
  );
}

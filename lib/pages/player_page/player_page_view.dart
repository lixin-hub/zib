import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zib/pages/player_page/player_page_logic.dart';
import 'package:zib/views/DesktopPlayerPage.dart';
import 'package:zib/views/MobilePlayerPage.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({super.key});

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  final logic = Get.put(PlayerPageLogic());
  final mobilePlayer = const MobilePlayerPage();
  final desktopPlayer = const DesktopPlayerPage();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;
    double padding = 0;
    // if (width > 700) {
    //   // padding = width / 1080 * 10;
    // }
    return Scaffold(
      body: Material(
        child: Container(
          // decoration: BoxDecoration(
          //   color: const Color(0xff294F7E),
          //   borderRadius: BorderRadius.circular(20)
          // ),
          padding: EdgeInsets.all(padding),
          child: Stack(
            children: [
              (width < 700) ? mobilePlayer : desktopPlayer,
            ],
          ),
        ),
      ),
    );
  }
}

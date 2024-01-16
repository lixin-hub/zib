import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:video_player/video_player.dart';

import '../component/UserRank.dart';
import '../component/media_player_kit/media_player_kit_view.dart';
import '../component/video_review/video_review_view.dart';

class DesktopPlayerPage extends StatefulWidget {
  final MediaKitPlayer player;

  const DesktopPlayerPage(this.player, {super.key});

  @override
  State<DesktopPlayerPage> createState() => _DesktopPlayerPageState();
}

class _DesktopPlayerPageState extends State<DesktopPlayerPage> {
  late VideoPlayerController _controller;
  late MediaKitPlayer _player;
  bool isUserRankOpen = true;
  bool isVideoReviewOpen = true;

  get _userRankWidth => isUserRankOpen ? 60.0 : 0.0;

  get _videoReviewWidth => isVideoReviewOpen ? 300.0 : 0.0;

  @override
  void initState() {
    super.initState();
    _player = widget.player;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, cons) {
      return Column(
        children: [
          //toolbar
          SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            isUserRankOpen = !isUserRankOpen;
                          });
                        },
                        icon: AnimatedRotation(
                          turns: isUserRankOpen ? 0.5 : 0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInBack,
                          child: const Icon(
                            Icons.exit_to_app_outlined,
                            color: Colors.white,
                          ),
                        )),
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.home, color: Colors.white)),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            isVideoReviewOpen = !isVideoReviewOpen;
                          });
                        },
                        icon: AnimatedRotation(
                          turns: isVideoReviewOpen ? 0 : 0.5,
                          curve: Curves.easeInBack,
                          duration: const Duration(milliseconds: 500),
                          child: const Icon(
                            Icons.exit_to_app_outlined,
                            color: Colors.white,
                          ),
                        )),
                  ],
                )
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //用户区
              AnimatedContainer(
                width: _userRankWidth,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10)),
                    color: Color(0xff294F7E)),
                duration: const Duration(milliseconds: 200),
                curve: Curves.ease,
                child: Column(
                  children: [
                    const UserRank(UserRankType.TYPE_CICLE).expanded(),
                  ],
                ),
              ),
              Container(
                  decoration: const BoxDecoration(
                      color: Color(0xff29407E)),
                  child: Column(
                    children: [
                      //player
                      Container(
                              decoration: const BoxDecoration(color: Colors.white), child: _player)
                          .expanded(),
                      //bottom
                      const SizedBox(
                        height: 100,
                        child: Row(
                          children: [],
                        ),
                      ),
                    ],
                  )).expanded(flex: 1),
              AnimatedContainer(
                  width: _videoReviewWidth,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only( bottomRight: Radius.circular(10)),
                      color: Color(0xff094F7E)),
                  duration: const Duration(milliseconds: 200),
                  constraints: BoxConstraints(maxWidth: min(400, 400 * (cons.maxWidth / 1080))),
                  child: const VideoReview()),
            ],
          ).expanded(),
        ],
      );
    });
  }
}

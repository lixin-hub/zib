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

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle l1 = const TextStyle(color: Colors.white, fontWeight: FontWeight.w800);
    TextStyle l2 = const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500);
    TextStyle l3 = const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w300);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //头像
          Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  const Positioned(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.red,
                      backgroundImage: AssetImage("images/banner.png"),
                    ),
                  ),
                  Positioned(
                      bottom: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(5)),
                        child: const Text(
                          "LIVE",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ))
                ],
              ),
              //基本信息
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("神奇的宇宙", style: l1).padding(bottom: 5),
                  Text("第一集：宇宙的诞生", style: l2),
                  Text(
                    "宇宙的起源一直就是人类一直最寻的谜团...",
                    style: l3,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
          //播放信息
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                  onPressed: () {},
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(null),
                      padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 5)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ))),
                  icon: const Icon(Icons.add_box),
                  label: const Text("Fellow")),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  const Icon(
                    Icons.person,
                    color: Colors.orange,
                    size: 16,
                  ),
                  const Text(
                    "1024",
                    style: TextStyle(color: Colors.orange, fontSize: 13),
                  ),
                  Text("12:30", style: l2).padding(left: 5),
                  const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                    size: 15,
                  )
                ],
              ).padding(top: 10)
            ],
          )
        ],
      ),
    );
  }
}

class _DesktopPlayerPageState extends State<DesktopPlayerPage> {
  late VideoPlayerController _controller;
  late MediaKitPlayer _player;
  bool isUserRankOpen = true;
  bool isVideoReviewOpen = true;
  var _width = 300.0;
  var dragHover = false;
  var draging = false;

  get _userRankWidth => isUserRankOpen ? 60.0 : 0.0;

  get _videoReviewWidth => isVideoReviewOpen ? _width : 0.0;

  set _videoReviewWidth(var v) {
    _width = v;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, cons) {
      return Column(
        children: [
          //toolbar
          Container(
            decoration: const BoxDecoration(color: Color(0xff18171C)),
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
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10)),
                    color: Color(0xff1E1D23)),
                duration: const Duration(milliseconds: 200),
                curve: Curves.ease,
                child: Column(
                  children: [
                    const UserRank(UserRankType.TYPE_CICLE).expanded(),
                  ],
                ),
              ),
              //中间部分
              Column(
                children: [
                  //player
                  Container(decoration: const BoxDecoration(color: Colors.white), child: _player)
                      .expanded(),
                  //bottom
                  Container(
                      decoration: const BoxDecoration(color: Color(0xff0E0E10)),
                      child: const Info()),
                ],
              ).expanded(),
              //评论区
              AnimatedContainer(
                  width: _videoReviewWidth,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(10)),
                      color: Color(0xff17171B)),
                  duration: (draging || dragHover)
                      ? const Duration(milliseconds: 0)
                      : const Duration(milliseconds: 200),
                  curve: Curves.ease,
                  constraints: BoxConstraints(maxWidth: min(400, 400 * (cons.maxWidth / 1080))),
                  child: Stack(
                    children: [
                      const VideoReview(),
                      // 拖动条
                      Visibility(
                        visible: dragHover || draging,
                        child: Container(
                            height: double.infinity,
                            color: (draging || dragHover) ? Colors.blue : Colors.transparent,
                            child: const Icon(Icons.drag_indicator, size: 15)),
                      ),
                      MouseRegion(
                        onEnter: (e) {
                          setState(() {
                            dragHover = true;
                          });
                        },
                        onExit: (e) {
                          setState(() {
                            dragHover = false;
                          });
                        },
                        cursor: SystemMouseCursors.resizeLeftRight,
                        child: SizedBox(
                            width: 50,
                            child: GestureDetector(
                              onHorizontalDragEnd: (e) {
                                setState(() {
                                  draging = false;
                                });
                              },
                              onHorizontalDragCancel: () {
                                setState(() {
                                  draging = false;
                                });
                              },
                              onHorizontalDragUpdate: (details) {
                                draging = true;
                                var dx = details.globalPosition.dx;
                                var width = MediaQuery.of(context).size.width;
                                var diff = width - dx;
                                setState(() {
                                  _videoReviewWidth = diff;
                                  // 控制评论区最小宽度
                                  _videoReviewWidth =
                                      _videoReviewWidth.clamp(100.0, double.infinity);
                                });
                              },
                            )),
                      ),
                    ],
                  )),
            ],
          ).expanded(),
        ],
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _player = widget.player;
  }
}

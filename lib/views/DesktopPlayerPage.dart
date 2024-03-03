import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:video_player/video_player.dart';
import 'package:zib/common/ThemeColors.dart';
import 'package:zib/common/Types.dart';
import 'package:zib/component/MiniCommentRegion.dart';
import 'package:zib/component/Toolbar.dart';
import 'package:zib/main.dart';
import 'package:zib/pages/player_page/player_page_logic.dart';

import '../component/UserRank.dart';
import '../component/media_player_kit/media_player_kit_view.dart';
import '../component/video_review/video_review_view.dart';

class DesktopPlayerPage extends StatefulWidget {
  const DesktopPlayerPage({super.key});

  @override
  State<DesktopPlayerPage> createState() => _DesktopPlayerPageState();
}

class _DesktopPlayerPageState extends State<DesktopPlayerPage> {
  var playerLogic = Get.find<PlayerPageLogic>();
  final MediaKitPlayer _player = MediaKitPlayer();
  late VideoPlayerController _controller;
  var dragHover = false;
  var drag = false;
  bool isVideoReviewOpen = true;
  bool isUserRankOpen = true;
  var _width = 300.0;

  get _userRankWidth => isUserRankOpen ? 60.0 : 0.0;

  get _videoReviewWidth => isVideoReviewOpen ? _width : 0.0;

  set _videoReviewWidth(var v) {
    _width = v;
  }

  void toolbarCallback(ToolbarCallbackType type) {
    switch (type) {
      case ToolbarCallbackType.BACK:
        _controller.pause();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          //下一帧退回
          Get.back();
        });
        break;
      case ToolbarCallbackType.REVIEW:
        setState(() {
          isVideoReviewOpen = !isVideoReviewOpen;
        });
        break;
      case ToolbarCallbackType.USER_RANK:
        setState(() {
          isUserRankOpen = !isUserRankOpen;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, cons) {
      return Column(
        children: [
          //toolbar
          Toolbar(toolbarCallback),
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
                      decoration: const BoxDecoration(
                        color: ThemeColors.backgroundColor,
                      ),
                      child: const Info()),
                ],
              ).expanded(),
              //评论区
              AnimatedContainer(
                  width: _videoReviewWidth,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(10)),
                      color: Color(0xff17171B)),
                  duration: (drag || dragHover)
                      ? const Duration(milliseconds: 0)
                      : const Duration(milliseconds: 200),
                  curve: Curves.ease,
                  constraints: BoxConstraints(maxWidth: min(400, 400 * (cons.maxWidth / 1080))),
                  child: Stack(
                    children: [
                      const VideoReview(),
                      // 拖动条
                      Visibility(
                        visible: dragHover || drag,
                        child: Container(
                            height: double.infinity,
                            color: (drag || dragHover)
                                ? ThemeColors.menuTextColor
                                : Colors.transparent,
                            child: const Icon(Icons.drag_indicator, size: 12)),
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
                            width: 15,
                            child: GestureDetector(
                              onHorizontalDragEnd: (e) {
                                setState(() {
                                  drag = false;
                                });
                              },
                              onHorizontalDragCancel: () {
                                setState(() {
                                  drag = false;
                                });
                              },
                              onHorizontalDragUpdate: (details) {
                                drag = true;
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
    _controller = _player.controller;
  }
}

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  var _showCommentRegion = false;
  var playerLogic = Get.find<PlayerPageLogic>();

  @override
  void initState() {
    super.initState();
    eventBus.on().listen((event) {
      if (event == Events.REVIEW_CLOSE) {
        _showCommentRegion = true;
      }
      if (event == Events.REVIEW_OPPEN) {
        _showCommentRegion = false;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    TextStyle l1 = const TextStyle(color: Colors.white, fontWeight: FontWeight.w800);
    TextStyle l2 = const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500);
    TextStyle l3 = const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w300);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 70,
      child: Obx(() {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //头像
            Expanded(
              flex: 1,
              child: Row(
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
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(playerLogic.mainSpeakerInfo['nickName'] ?? '', style: l1)
                            .padding(bottom: 5),
                        Text(playerLogic.liveRoomInfo['title'] ?? '', style: l2),
                        Text(
                          playerLogic.liveRoomInfo['introduction'] ?? '',
                          style: l3,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //评论区
            Container(
              alignment: Alignment.center,
              child: AnimatedContainer(
                constraints: BoxConstraints(maxWidth: _showCommentRegion ? 400 : 100),
                duration: const Duration(milliseconds: 200),
                child: Offstage(offstage: !_showCommentRegion, child: const MiniCommentRegin()),
              ),
            ),
            //播放信息
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                    onPressed: () {},
                    style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(null),
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 5)),
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
                    Text(
                      playerLogic.liveRoomInfo['onlineNumber']?.toString() ?? '',
                      style: const TextStyle(color: Colors.orange, fontSize: 13),
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
        );
      }),
    );
  }
}

import 'dart:async';
import 'dart:math';

import 'package:contextmenu/contextmenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zib/common/ThemeColors.dart';
import 'package:zib/component/CardDetail.dart';

class CardItem extends StatefulWidget {
  final Map<String, dynamic> item;

  const CardItem(this.item, {super.key});

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  late var item;
  var _isHover = false;
  Timer? _timer;
  bool isUp = true;
  GlobalKey targetKey = GlobalKey();

  Offset getWidgetPosition() {
    // 获取目标组件的 RenderBox
    RenderBox targetRenderBox = targetKey.currentContext!.findRenderObject() as RenderBox;
    // 将局部坐标转换为全局坐标
    Offset targetGlobalPosition = targetRenderBox.localToGlobal(Offset.zero);
    return targetGlobalPosition;
  }

  @override
  void initState() {
    super.initState();
    item = widget.item;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(key: targetKey, children: [
      Card(
        shadowColor: Colors.white,
        elevation: 2,
        color: ThemeColors.primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                "images/card.jpg",
                fit: BoxFit.cover,
              ).aspectRatio(aspectRatio: 10 / 9),
            ),
            Text(
              item['title'] ?? '',
              maxLines: 1,
              style: TextStyle(
                  color: ThemeColors.primaryTextColor,
                  fontSize: 16,
                  overflow: TextOverflow.ellipsis),
            ),
            Text(
              item['introduction'] ?? '',
              maxLines: 1,
              style: TextStyle(
                  color: ThemeColors.secondaryTextColor,
                  fontSize: 10,
                  overflow: TextOverflow.ellipsis),
            ),
          ],
        ).constrained(width: 250),
      ),
      Positioned.fill(
        child: InkWell(
            onTapDown: (detail) {
              showContextMenu(detail.globalPosition, context, (context) {
                return [CardDetail(item)];
              }, 0.0, 300.0);
            },
            onHover: (e) {
              setState(() {
                _isHover = e;
              });
              _timer?.cancel();
              if (!e || !isUp) {
                return;
              }
              _timer = Timer(const Duration(milliseconds: 1500), () {
                _timer = null;
                Offset offset = getWidgetPosition();
                showContextMenu(Offset(max(offset.dx, 0), offset.dy), context, (context) {
                  return [CardDetail(item)];
                }, 0.0, 300.0);
              });
            },
            child: Container(
              margin: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  color: _isHover ? ThemeColors.selectedColor.withOpacity(0.2) : Colors.transparent,
                  borderRadius: BorderRadius.circular(10)),
              // width: 400,
            )),
      ),
      Positioned(
        top: 5,
        right: 4,
        child: ElevatedButton.icon(
            onPressed: () {
              Get.toNamed("player", arguments: item['id']);
            },
            icon: const Icon(Icons.play_arrow),
            label: const Text("播放")),
      ),
    ]);
  }
}

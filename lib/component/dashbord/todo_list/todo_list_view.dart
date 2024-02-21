import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zib/api/live.dart';

import 'todo_list_logic.dart';

class TodoList extends StatelessWidget {
  TodoList({super.key});

  final logic = Get.put(TodoListLogic());

  @override
  Widget build(BuildContext context) {
    var listData = logic.listData;
    var rotate = logic.rotate;
    return Obx(() {
      return Container(
        constraints: const BoxConstraints(maxHeight: 300),
        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF6F2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Todo List",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20, color: Colors.black),
                ),
                AnimatedRotation(
                  turns: rotate.value,
                  onEnd: () {
                    rotate.value = 0;
                  },
                  duration: const Duration(milliseconds: 300),
                  child: IconButton(
                    tooltip: '刷新',
                    onPressed: () {
                      rotate.value += 1;
                      logic.reload();
                    },
                    icon: const Icon(
                      Icons.refresh,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ).expanded(flex: 0),
            if (listData.isEmpty)
              const Center(child: Text('暂时没有任务！')).height(30)
            else
              ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: listData.length,
                itemBuilder: (context, index) {
                  var timeStr = listData[index]['startTime'];
                  var time = DateFormat('dd日hh:mm:ss').format(DateTime.parse(timeStr));
                  return ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    title: Tooltip(
                      message: listData[index]['title'],
                      child: Text(
                        listData[index]['title'],
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 1,
                      ),
                    ),
                    dense: true,
                    selectedColor: Colors.pinkAccent,
                    selected: true,
                    subtitle: Tooltip(
                        message: '直播开始时间：${listData[index]['startTime']}',
                        child: Text(time).marginOnly(right: 2)),
                    trailing: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          tooltip: '复制直播链接',
                          onPressed: () {
                            var content =
                                '直播地址：rtmp://localhost:1985/myapp?s=${listData[index]['id']}\n 推流码：${listData[index]['liveToken']}';
                            // 复制直播地址到剪贴板
                            Clipboard.setData(ClipboardData(text: content));
                            // 提示用户已复制
                            AnimatedSnackBar.material(
                              '直播地址复制成功',
                              type: AnimatedSnackBarType.success,
                              desktopSnackBarPosition: DesktopSnackBarPosition.topCenter,
                            ).show(context);
                          },
                          iconSize: 18,
                          constraints: const BoxConstraints(maxWidth: 35),
                          icon: const Icon(
                            Icons.copy_all,
                          ),
                        ),
                        IconButton(
                          constraints: const BoxConstraints(maxWidth: 35),
                          tooltip: '删除直播',
                          onPressed: () {
                            deleteLiveRoom(listData[index]['id']);
                            logic.reload();
                          },
                          iconSize: 18,
                          icon: const Icon(Icons.auto_delete_outlined),
                        ),
                      ],
                    ),
                  );
                },
              ).flexible(flex: 1),
          ],
        ),
      );
    });
  }
}

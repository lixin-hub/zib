import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key, Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 300),
      padding: const EdgeInsets.only(top: 10,bottom: 10,left: 10),
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
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_horiz,
                  color: Colors.black,
                ),
              ),
            ],
          ).expanded(flex: 0),
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: 2,
            itemBuilder: (context, index) {
              return ListTile(
                contentPadding: const EdgeInsets.all(0),
                leading: const Icon(Icons.abc),
                title: Text('直播标题$index'),
                trailing: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('下午2点10分').marginOnly(right: 2),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.auto_delete_outlined,
                        size: 15,
                      ),
                    ),
                  ],
                ),
              );
            },
          ).flexible(flex: 1),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

class CollectList extends StatelessWidget {
  const CollectList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 200),
      padding: const EdgeInsets.only(top: 10,bottom: 10,left: 10),
      decoration:
      BoxDecoration(color: const Color(0xFFF1ECFE), borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Collect List",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20, color: Colors.black),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_horiz,
                    color: Colors.black,
                  ))
            ],
          ).flexible(flex: 0),
          ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 5,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.abc),
                  title: Text('直播标题$index'),
                  contentPadding: const EdgeInsets.all(0),
                  onTap: (){},
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
                          ))
                    ],
                  ),
                );
              }).flexible(flex: 1),
        ],
      ),
    );
  }
}

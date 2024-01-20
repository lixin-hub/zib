import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zib/common/ThemeColors.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [const Infos(), const LiveList().expanded()],
    );
  }
}

class Infos extends StatelessWidget {
  const Infos({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration:
          BoxDecoration(color: ThemeColors.primaryColor, borderRadius: BorderRadius.circular(10)),
      child: const Row(
        children: [],
      ),
    );
  }
}

class LiveList extends StatelessWidget {
  const LiveList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.electric_bolt),
                  label: const Text("直播列表"),
                  style: ButtonStyle(
                      shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0), // 设置圆角半径
                      )),
                      backgroundColor: MaterialStateProperty.all(Colors.transparent)),
                  onPressed: () {},
                ),
                ElevatedButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text("创建直播"),
                  style: ButtonStyle(
                      shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0), // 设置圆角半径
                      )),
                      backgroundColor: MaterialStateProperty.all(Colors.transparent)),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: ThemeColors.primaryColor, borderRadius: BorderRadius.circular(10)),
              child: const Column(
                children: [],
              ),
            ),
          )
        ],
      ),
    );
  }
}

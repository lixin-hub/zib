import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'live_management_logic.dart';

const primaryColor = Color(0xff302F4E);
const sideColor = Color(0xff313050);
const backgroundColor = Color(0xff212437);
const textColor = Color(0xff7874A7);
const menuTextColor = Color(0xff9794A8);
const sideWidth = 250.0;
const menuFontStyle = TextStyle(fontSize: 20, color: Colors.indigo);

class LiveManagement extends StatelessWidget {
  LiveManagement({super.key});

  final logic = Get.put(LiveManagementLogic());

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [const Header(), const Body().expanded()],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      height: 60,
      child: Row(
        children: [
          //logo
          const SizedBox(
            width: sideWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "BIZ",
                  style: TextStyle(color: Colors.orange, fontSize: 40, fontWeight: FontWeight.w800),
                ),
                Icon(Icons.electric_bolt),
                Icon(Icons.electric_bolt),
                Icon(Icons.electric_bolt),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text("首页", style: menuFontStyle).padding(left: 30),
                    Text("账户中心", style: menuFontStyle.copyWith(color: menuTextColor))
                        .padding(left: 30),
                    Text("直播中心", style: menuFontStyle.copyWith(color: menuTextColor))
                        .padding(left: 30),
                  ],
                ),
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.red,
                      backgroundImage: AssetImage("images/banner.png"),
                    ),
                    const Text("LowIQBully", style: TextStyle(fontSize: 20, color: menuTextColor))
                        .padding(horizontal: 10),
                    Container(
                      width: 1,
                      height: 30,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      color: Colors.grey,
                    ),
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Icon(
                          Icons.exit_to_app_rounded,
                          color: menuTextColor,
                        ))
                  ],
                )
              ],
            ).padding(horizontal: 20),
          ),
        ],
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: const Row(
        children: [Side(), Expanded(child: Main())],
      ),
    );
  }
}

class Side extends StatelessWidget {
  const Side({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sideWidth,
      margin: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(color: sideColor, borderRadius: BorderRadius.circular(10)),
      child: const Column(
        children: [],
      ),
    );
  }
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      color: backgroundColor,
      child: const Column(
        children: [Dashboard(), Expanded(child: LiveList())],
      ),
    );
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(10)),
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
              decoration:
                  BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(10)),
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

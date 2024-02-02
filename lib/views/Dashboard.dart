import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zib/common/ThemeColors.dart';
import 'package:zib/component/dashbord/MyLineChart.dart';
import 'package:zib/component/dashbord/PageDetailTable.dart';
import 'package:zib/component/dashbord/QuickAction.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [const Left().expanded(), const Right().expanded()],
    );
  }
}

class Left extends StatelessWidget {
  const Left({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.5), borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
      const Text(
        "Dashboard",
        style: TextStyle(color: Colors.black, fontSize: 30),
      ).marginSymmetric(vertical: 20),
      const QuickAction().constrained(maxWidth: 372),
              ],
            ),
    );
  }
}

class Right extends StatelessWidget {
  const Right({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

// Column(
// children: [const Infos(), const LiveList().expanded()],
// ).backgroundColor(ThemeColors.backgroundColor),
class Infos extends StatelessWidget {
  const Infos({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration:
          BoxDecoration(color: ThemeColors.primaryColor, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [const MyLineChart().expanded()],
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
              child: const PagedDataTable(),
            ),
          )
        ],
      ),
    );
  }
}

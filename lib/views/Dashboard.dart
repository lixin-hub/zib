import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zib/common/ThemeColors.dart';
import 'package:zib/component/dashbord/CollectList.dart';
import 'package:zib/component/dashbord/LiveIntent.dart';
import 'package:zib/component/dashbord/MyBarChart.dart';
import 'package:zib/component/dashbord/MyLineChart.dart';
import 'package:zib/component/dashbord/MyPieChart.dart';
import 'package:zib/component/dashbord/PageDetailTable.dart';
import 'package:zib/component/dashbord/QuickAction.dart';
import 'package:zib/component/dashbord/todo_list/todo_list_view.dart';
class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [const Left().width(350), const Right().expanded()],
      ),
    );
  }
}

class Left extends StatelessWidget {
  const Left({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Actions",
            style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.w800),
          ).marginSymmetric(vertical: 20),
          const QuickAction(),
           TodoList().marginSymmetric(vertical: 10),
          const CollectList().expanded()
        ],
      ),
    );
  }
}

class Right extends StatelessWidget {
  const Right({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, cons) {
      var w = cons.maxWidth;
      var vw = w;
      print('w:$w');
      if (w > 800) {
        vw = w - 540;
      } else if (w < 800 && w > 600) {
        vw = w - 290;
      }
      print('vw$vw');
      return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Data",
              style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.w800),
            ).marginSymmetric(vertical: 20),
            SingleChildScrollView(
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                children: [
                  const LiveIntent().marginSymmetric(vertical: 10),
                  const MyPieChart(), MyBarChart().constrained(maxWidth: vw), const MyPieChart()],
              ),
            ).expanded()
          ],
        ),
      );
    });
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

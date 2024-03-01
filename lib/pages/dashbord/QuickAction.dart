import 'package:contextmenu/contextmenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zib/component/BottomSheet/QuickLive.dart';

class QuickAction extends StatefulWidget {
  const QuickAction({super.key});

  @override
  State<QuickAction> createState() => _QuickActionState();
}

class _QuickActionState extends State<QuickAction> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration:
          BoxDecoration(color: const Color(0xFFECF1FF), borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Quick Actions",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20, color: Colors.black),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_horiz,
                    color: Colors.black,
                  ))
            ],
          ),
          Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.spaceAround,
            spacing: 10,
            runSpacing: 10,
            children: [
              ActionIcon(Icons.timer_3, "快速直播", () {
                showContextMenu(
                    const Offset(150, 300), context, (e) => [QuickLiveForm()], 0.0, 300.0);
                // showModalBottomSheet(context: context, builder:  QuickLiveSheet().getSheetBuilder());
                // showFlexibleBottomSheet(
                //     context: context,
                //     bottomSheetColor: Colors.transparent,
                //     bottomSheetBorderRadius: BorderRadius.circular(20),
                //     builder: QuickLiveSheet().getSheetBuilder());
              }),
              ActionIcon(Icons.add_a_photo_outlined, "加入直播", () {
                showContextMenu(
                    const Offset(150, 300), context, (e) => [QuickLiveForm()], 0.0, 300.0);
              }),
              ActionIcon(Icons.timer_sharp, "预订直播", () {}),
            ],
          ).marginOnly(bottom: 20)
        ],
      ),
    );
  }
}

class ActionIcon extends StatelessWidget {
  const ActionIcon(this.icon, this.label, this.onPress, {super.key});

  final IconData icon;
  final String label;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      padding: const EdgeInsets.only(top: 8, bottom: 5, left: 8, right: 8),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          IconButton(
              onPressed: onPress,
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green.withOpacity(0.2))),
              icon: Icon(
                icon,
                color: Colors.green,
              )),
          const SizedBox(height: 3),
          Text(
            label,
            style: const TextStyle(color: Colors.black, fontSize: 14),
          )
        ],
      ),
    );
  }
}

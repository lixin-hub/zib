import 'package:flutter/material.dart';
import 'package:zib/common/ThemeColors.dart';

class Side extends StatefulWidget {
  final ValueChanged<int> selectChange;
  final int currentIndex;

  const Side(this.selectChange, this.currentIndex, {super.key});

  @override
  State<Side> createState() => _SideState();
}

class _SideState extends State<Side> {
  var _extended = false;
  static const sideWidth = 200.0;

  _onDestinationSelected(int index) {
    widget.selectChange(index);
  }

  @override
  Widget build(BuildContext context) {
    const List<NavigationRailDestination> destinations = [
      NavigationRailDestination(
          icon: Icon(Icons.dashboard_outlined),
          label: Text(
            "Dashboard",
            style: ThemeColors.unSelectedMenuFontStyle,
          )),
      NavigationRailDestination(
          icon: Icon(Icons.video_camera_back_outlined),
          label: Text(
            "视频管理",
            style: ThemeColors.unSelectedMenuFontStyle,
          )),
      NavigationRailDestination(
          icon: Icon(Icons.rocket_launch_outlined),
          label: Text(
            "评论机器人",
            style: ThemeColors.unSelectedMenuFontStyle,
          )),
      NavigationRailDestination(
          icon: Icon(Icons.rate_review_outlined),
          label: Text(
            "评论与弹幕",
            style: ThemeColors.unSelectedMenuFontStyle,
          )),
      NavigationRailDestination(
          icon: Icon(Icons.account_box_outlined),
          label: Text(
            "账户管理",
            style: ThemeColors.unSelectedMenuFontStyle,
          )),
    ];
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 30),
        decoration:
        BoxDecoration(color: ThemeColors.sideColor, borderRadius: BorderRadius.circular(10)),
        child: NavigationRail(
            leading: Container(
                alignment: Alignment.centerLeft,
                child: IconButton(
                    icon: const Icon(
                      Icons.menu,
                      color: ThemeColors.menuTextColor,
                    ),
                    onPressed: () {
                      setState(() {
                        _extended = !_extended;
                      });
                    })),
            elevation: 2,
            extended: _extended,
            backgroundColor: Colors.transparent,
            onDestinationSelected: _onDestinationSelected,
            destinations: destinations,
            selectedIndex: widget.currentIndex,
            minExtendedWidth: sideWidth));
  }
}
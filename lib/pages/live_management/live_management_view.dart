import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zib/main.dart';
import 'package:zib/views/Dashboard.dart';

import '../../common/ThemeColors.dart';
import 'live_management_logic.dart';

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
      color: ThemeColors.primaryColor,
      height: 60,
      child: Row(
        children: [
          //logo
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Get.toNamed('/');
                    },
                    icon: const Icon(Icons.home, color: ThemeColors.menuTextColor)),
                const Text(
                  "BIZ",
                  style: TextStyle(color: Colors.orange, fontSize: 40, fontWeight: FontWeight.w800),
                ),
                const Icon(Icons.electric_bolt, color: Colors.orange),
                Icon(Icons.electric_bolt, color: Colors.orange.withOpacity(0.8)),
                Icon(Icons.electric_bolt, color: Colors.orange.withOpacity(0.6)),
              ],
            ).padding(left: 5),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    // const Text("管理首页", style: selectedMenuFontStyle).padding(left: 20),
                    // const Text("账户管理", style: unSelectedMenuFontStyle).padding(left: 30),
                    // const Text("视频管理", style: unSelectedMenuFontStyle).padding(left: 30),
                  ],
                ).expanded(flex: 0),
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.red,
                      backgroundImage: AssetImage("images/banner.png"),
                    ),
                    const Text("LowIQBully",
                            style: TextStyle(fontSize: 20, color: ThemeColors.menuTextColor))
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
                          color: ThemeColors.menuTextColor,
                        ))
                  ],
                ).expanded(flex: 0)
              ],
            ).padding(horizontal: 20),
          ),
        ],
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var liquidController = LiquidController();
  var _currentInde = 0;

  _onDestinationSelected(int index) {
    logger.i("index:$index");
    setState(() {
      _currentInde = index;
    });
    liquidController.animateToPage(page: index);
  }

  @override
  Widget build(BuildContext context) {
    final _menus = <Widget>[
      const Dashboard(),
      Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.blue,
      ),
      Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.red,
      ),
      Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.grey,
      ),
      Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.indigo,
      ),
    ];
    return Container(
      color: ThemeColors.backgroundColor,
      child: Row(
        children: [
          Side(_onDestinationSelected, _currentInde),
          Expanded(
              child: Container(
                  padding: const EdgeInsets.all(30),
                  child: LiquidSwipe(
                    pages: _menus,
                    liquidController: liquidController,
                    waveType: WaveType.liquidReveal,
                    onPageChangeCallback: (index) {
                      _currentInde = index;
                      setState(() {});
                    },
                  )))
        ],
      ),
    );
  }
}

// AnimatedSwitcher(
// duration: const Duration(milliseconds: 500),
// transitionBuilder: (Widget child, Animation<double> animation) {
// var begin = Offset(_currentSelectIndex > 0 ? 1.0 : 1.0, 0.0);
// var end = Offset.zero;
// var curve = Curves.ease;
//
// var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
// var offsetAnimation = animation.drive(tween);
//
// return SlideTransition(
// position: offsetAnimation,
// child: child,
// );
// },
// child:)
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

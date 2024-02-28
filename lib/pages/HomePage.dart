import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:zib/common/Sp.dart';
import 'package:zib/main.dart';
import 'package:zib/views/main_central/main_central_view.dart';

import '../api/user.dart';
import '../views/aside/aside_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final zoomDrawerController = Get.put(ZoomDrawerController());

  @override
  void initState() {
    super.initState();
    init() async {
      var token = SP.getString('token');
      var clientid = SP.getString('clientid');
      if (clientid.isNotEmpty) {
        store.clientid = clientid;
      }
      if (token.isNotEmpty) {
        store.token = token;
        var value = await userInfoApi();
        if (value != null) {
          Get.toNamed('/player');
        }
      } else {
        Get.toNamed('/login');
      }
    }

    init();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ZoomDrawer(
            controller: zoomDrawerController,
            menuScreen: const Aside(),
            mainScreen: MainCentral(),
            androidCloseOnBackTap: true,
            borderRadius: 24.0,
            showShadow: true,
            angle: -5.0,
            mainScreenScale: 0.2,
            mainScreenTapClose: true,
            menuScreenTapClose: true,
            drawerShadowsBackgroundColor: Colors.grey));
  }
}

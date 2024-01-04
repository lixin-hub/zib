import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zib/common/ThemeColors.dart';
import 'package:zib/views/main_central/main_central_view.dart';

import '../views/aside/aside_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Row(children: [const Aside(), MainCentral().expanded()])
            .backgroundColor(ThemeColors.mainCentralColor));
  }
}

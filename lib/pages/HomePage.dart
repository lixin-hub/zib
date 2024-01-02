import 'package:flutter/material.dart';
import 'package:zib/views/Aside.dart';
import 'package:zib/views/MainCentral.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            alignment: Alignment.center,
            color: Colors.black54,
            child: const Row(
              children: [Aside(), MainCentral()],
            )));
  }
}

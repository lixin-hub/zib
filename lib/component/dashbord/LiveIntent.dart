import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zib/component/dashbord/MyLineChart.dart';

class LiveIntent extends StatelessWidget {
  const LiveIntent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Live Intent",
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20, color: Colors.black),
          ),
          const MyLineChart().expanded()
        ],
      ),
    );
  }
}

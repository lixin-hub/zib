import 'package:flutter/material.dart';
import 'package:zib/common/ThemeColors.dart';

class HighlightPage extends StatelessWidget {
  const HighlightPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("HighLight", style: TextStyle(color: ThemeColors.primaryTextColor, fontSize: 48));
  }
}

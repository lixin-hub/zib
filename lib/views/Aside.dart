import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zib/common/ThemeColors.dart';

import '../component/MenuItem.dart';

class Aside extends StatefulWidget {
  const Aside({super.key});

  @override
  State<Aside> createState() => _AsideState();
}

class _AsideState extends State<Aside> {
  final _items = <Widget>[];

  //first-level menu
  final _itemList = [
    {"iconData": Icons.explore, "title": "Explore"},
    {"iconData": Icons.highlight, "title": "Highlights"},
    {"iconData": Icons.follow_the_signs, "title": "Following"}
  ];

  // current selected Index
  var _selectedIndex = 0;

  //reuse divider
  var divider = SizedBox(
      height: 24, child: Divider(height: 1, color: ThemeColors.nativeColor));

  @override
  Widget build(BuildContext context) {
    _items.clear();
    for (var i = 0; i < _itemList.length; i++) {
      var {"title": title, "iconData": iconData} = _itemList[i];
      _items.add(MenuItem(
        onTap: () => setState(() {
          _selectedIndex = i;
        }),
        itemData: MenuItemData(iconData as IconData, title as String),
        isSelected: i == _selectedIndex,
      ).padding(vertical: 6));
    }
    //add divider
    _items.add(divider);
    return Container(
      color: ThemeColors.asideBackgroundColor,
      width: 272,
      child: Column(
        children: [
          //title
          const Text("BULLY.COM")
              .fontSize(20)
              .textStyle(TextStyle(color: ThemeColors.primaryTextColor))
              .alignment(Alignment.centerLeft)
              .padding(left: 24),
          //first menu
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: _items,
          ).padding(top: 16, bottom: 32, horizontal: 24),

          //second Title
          const Text("Group")
              .fontSize(20)
              .textStyle(TextStyle(color: ThemeColors.primaryTextColor))
              .fontWeight(FontWeight.w800)
              .alignment(Alignment.centerLeft)
              .padding(left: 24),
          Column(
            children: [],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zib/common/ThemeColors.dart';

class MenuItemData {
  final String title;
  final IconData iconData;

  const MenuItemData(this.iconData, this.title);
}

class MenuItem extends StatefulWidget {
  final GestureTapCallback onTap;
  final bool isSelected;
  final MenuItemData itemData;

  const MenuItem({super.key, required this.onTap, required this.itemData, this.isSelected = false});

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = _isHover ? Colors.blue : Colors.transparent;
    if (widget.isSelected) {
      backgroundColor = Colors.blue;
    }
    return MouseRegion(
      onEnter: (e) => setState(() {
        _isHover = true;
      }),
      onExit: (e) => setState(() {
        _isHover = false;
      }),
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Row(
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  child: Icon(widget.itemData.iconData,
                      size: 12, color: ThemeColors.primaryTextColor)),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.itemData.title,
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  style: TextStyle(fontSize: 12, color: ThemeColors.primaryTextColor),
                ),
              ).expanded(flex: 1)
            ],
          ),
        ),
      ),
    );
  }
}

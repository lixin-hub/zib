import 'package:flutter/material.dart';

class RefreshButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Color color;
  final IconData iconData;

  const RefreshButton(this.onPressed,
      {super.key, this.iconData = Icons.refresh, this.color = Colors.grey});

  @override
  State<RefreshButton> createState() => _RefreshButtonState();
}

class _RefreshButtonState extends State<RefreshButton> {
  var rotate = 0.0;

  @override
  Widget build(BuildContext context) {
    return AnimatedRotation(
      turns: rotate,
      onEnd: () {
        rotate = 0;
      },
      duration: const Duration(milliseconds: 300),
      child: IconButton(
        tooltip: '刷新',
        onPressed: () {
          rotate += 1;
          widget.onPressed.call();
        },
        icon:  Icon(
          widget.iconData,
          color: widget.color,
        ),
      ),
    );
  }
}

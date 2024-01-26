import 'package:animated_neumorphic/animated_neumorphic.dart';
import 'package:flutter/material.dart';
import 'package:zib/common/ThemeColors.dart';

class CommentItem extends StatelessWidget {
  final String comment;
  final String username;

  const CommentItem(this.username, this.comment, {super.key});

  @override
  Widget build(BuildContext context) {
    //此处务必包裹一个Row 或 column ，解决ListView item 无边界问题
    return LayoutBuilder(builder: (context, constrained) {
      // logger.i(constrained);
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedNeumorphicContainer(
            depth: 1.0,
            color: ThemeColors.backgroundColor,
            child: Container(
              constraints: BoxConstraints(maxWidth: constrained.maxWidth),
              margin: const EdgeInsets.symmetric(vertical: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Wrap(
                spacing: 2,
                direction: Axis.horizontal,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    alignment: Alignment.centerLeft,
                    height: 20,
                    width: 20,
                    child: const CircleAvatar(
                      backgroundColor: Colors.amber,
                      child: Icon(
                        Icons.person,
                        size: 20,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                  Text("$username:", style: const TextStyle(color: Colors.grey)),
                  Text(comment, style: const TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}

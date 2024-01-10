import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class CommentItem extends StatelessWidget {
  final String comment;
  final String username;

  const CommentItem(this.username, this.comment, {super.key});

  @override
  Widget build(BuildContext context) {
    final double maxWidth=MediaQuery.of(context).size.width*0.6;
    //此处务必包裹一个Row 或 column ，解决ListView item 无边界问题
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          constraints:  BoxConstraints(maxWidth: maxWidth),
          margin: const EdgeInsets.symmetric(vertical: 2),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black54.withOpacity(0.7)),
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
      ],
    );
  }
}

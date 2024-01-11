import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

//用户列表
class UserRank extends StatefulWidget {
  const UserRank({super.key});

  @override
  State<UserRank> createState() => _UserRankState();
}

class _UserRankState extends State<UserRank> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return UserItem("用户$index", index);
          }).expanded()
    ]);
  }
}

class UserItem extends StatelessWidget {
  final String userName;
  final int index;

  const UserItem(this.userName, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            //Rank
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.pink),
                child: Text("榜${index + 1}", style: const TextStyle(color: Colors.white))),
            const SizedBox(width: 5),
            Text(userName, style: const TextStyle(color: Colors.grey)),
          ]),
          //Avtor
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
          )
        ],
      ),
    );
  }
}

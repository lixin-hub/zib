import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zib/api/live.dart';
import 'package:zib/api/user.dart';
import 'package:zib/common/Types.dart';
import 'package:zib/main.dart';
import 'package:zib/pages/player_page/player_page_logic.dart';

enum UserRankType {
  TYPE_CICLE,
  TYPE_ITEM;
}

//用户列表
class UserRank extends StatefulWidget {
  final UserRankType userRankType;

  const UserRank(this.userRankType, {super.key});

  @override
  State<UserRank> createState() => _UserRankState();
}

class _UserRankState extends State<UserRank> {
  var playerPageLogic = Get.find<PlayerPageLogic>();
  var userIdList = [];

  loadUserList() {
    var roomId = playerPageLogic.liveRoomId;
    userRankList({'roomId': roomId}).then((res) {
      setState(() {
        userIdList = res['data'] ?? [];
        eventBus.fire(EventPayload(type: EventType.ONLINE_NUMBER, data: userIdList.length));
      });
    });
  }

  @override
  void initState() {
    super.initState();
    loadUserList();
    eventBus.on().listen((event) {
      if (event == EventType.USER_RANK_RESFREH) {
        loadUserList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.userRankType == UserRankType.TYPE_ITEM) {
      return Row(children: [
        ListView.builder(
            itemCount: userIdList.length,
            itemBuilder: (context, index) {
              return UserItem(userIdList[index], index);
            }).expanded()
      ]);
    } else {
      return Row(children: [
        ListView.builder(
            itemCount: userIdList.length,
            itemBuilder: (context, index) {
              return UserCircle(userIdList[index], index);
            }).expanded()
      ]);
    }
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

class UserCircle extends StatefulWidget {
  final String userId;
  final int index;

  const UserCircle(this.userId, this.index, {super.key});

  @override
  State<UserCircle> createState() => _UserCircleState();
}

class _UserCircleState extends State<UserCircle> {
  var userInfo = {};

  @override
  void initState() {
    super.initState();
    userSampleInfoById(widget.userId).then((res) {
      setState(() {
        userInfo = res;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Avtor
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            alignment: Alignment.center,
            child: const CircleAvatar(
              backgroundImage: NetworkImage("https://cdn.wallpapersafari.com/5/32/ZiLwrf.jpg"),
            ),
          ).expanded()
        ],
      ),
    );
  }
}

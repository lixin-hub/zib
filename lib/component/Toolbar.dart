import 'package:flutter/material.dart';
import 'package:zib/common/ThemeColors.dart';
import 'package:zib/common/Types.dart';
import 'package:zib/component/NeuButton.dart';
import 'package:zib/main.dart';

class Toolbar extends StatefulWidget {
  final ToolbarCallback callback;

  const Toolbar(this.callback, {super.key});

  @override
  State<Toolbar> createState() => ToolbarState();
}

class ToolbarState extends State<Toolbar> {
  bool isVideoReviewOpen = true;
  bool isUserRankOpen = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeColors.backgroundColor,
      // decoration: const BoxDecoration(color: Color(0xff18171C)),
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              NeuButton(
                  onTap: () {
                    setState(() {
                      isUserRankOpen = !isUserRankOpen;
                    });
                    widget.callback.call(ToolbarCallbackType.USER_RANK);
                  },
                  child: AnimatedRotation(
                    turns: isUserRankOpen ? 0.5 : 0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInBack,
                    child: const Icon(
                      Icons.exit_to_app_outlined,
                      color: ThemeColors.menuTextColor,
                    ),
                  )),
              NeuButton(
                  onTap: () {
                    widget.callback.call(ToolbarCallbackType.BACK);
                  },
                  child: const Icon(
                    Icons.home,
                    color: ThemeColors.menuTextColor,
                  )),
            ],
          ),
          Row(
            children: [
              NeuButton(
                  onTap: () {
                    setState(() {
                      isVideoReviewOpen = !isVideoReviewOpen;
                    });
                    widget.callback.call(ToolbarCallbackType.REVIEW);
                    eventBus.fire(isVideoReviewOpen ? Events.REVIEW_OPPEN : Events.REVIEW_CLOSE);
                  },
                  child: AnimatedRotation(
                    turns: isVideoReviewOpen ? 0 : 0.5,
                    curve: Curves.easeInBack,
                    duration: const Duration(milliseconds: 500),
                    child: const Icon(
                      Icons.exit_to_app_outlined,
                      color: ThemeColors.menuTextColor,
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }
}

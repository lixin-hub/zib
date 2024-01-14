import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:video_player/video_player.dart';

import 'VideoScrubber.dart';

class VideoProgressBar extends StatefulWidget {
  /// Construct an instance that displays the play/buffering status of the video
  /// controlled by [controller].
  ///
  /// Defaults will be used for everything except [controller] if they're not
  /// provided. [allowScrubbing] defaults to false, and [padding] will default
  /// to `top: 5.0`.
  const VideoProgressBar(
    this.controller, {
    super.key,
    this.colors = const VideoProgressColors(),
    required this.allowScrubbing,
    this.padding = const EdgeInsets.only(top: 5.0),
  });

  /// The [VideoPlayerController] that actually associates a video with this
  /// widget.
  final VideoPlayerController controller;

  /// The default colors used throughout the indicator.
  ///
  /// See [VideoProgressColors] for default values.
  final VideoProgressColors colors;

  /// When true, the widget will detect touch input and try to seek the video
  /// accordingly. The widget ignores such input when false.
  ///
  /// Defaults to false.
  final bool allowScrubbing;

  /// This allows for visual padding around the progress indicator that can
  /// still detect gestures via [allowScrubbing].
  ///
  /// Defaults to `top: 5.0`.
  final EdgeInsets padding;

  @override
  State<VideoProgressBar> createState() => _VideoProgressBarState();
}

class _VideoProgressBarState extends State<VideoProgressBar> {
  _VideoProgressBarState() {
    listener = () {
      if (!mounted) {
        return;
      }
      setState(() {});
    };
  }

  late VoidCallback listener;

  VideoPlayerController get controller => widget.controller;

  VideoProgressColors get colors => widget.colors;
  bool isHover = false;
  double maxHeight = 18.0;
  double hoverHeight = 8;

  @override
  void initState() {
    super.initState();
    controller.addListener(listener);
  }

  @override
  void deactivate() {
    controller.removeListener(listener);
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    double buildWidth = MediaQuery.of(context).size.width;
    Widget progressIndicator;
    if (controller.value.isInitialized) {
      final int duration = controller.value.duration.inMilliseconds;
      final int position = controller.value.position.inMilliseconds;

      int maxBuffering = 0;
      for (final DurationRange range in controller.value.buffered) {
        final int end = range.end.inMilliseconds;
        if (end > maxBuffering) {
          maxBuffering = end;
        }
      }
      progressIndicator = Stack(
        fit: StackFit.passthrough,
        children: <Widget>[
          LinearProgressIndicator(
            value: maxBuffering / duration,
            minHeight: isHover ? hoverHeight : 5,
            valueColor: AlwaysStoppedAnimation<Color>(colors.bufferedColor),
            backgroundColor: colors.backgroundColor,
          ),
          LinearProgressIndicator(
            minHeight: isHover ? hoverHeight : 5,
            value: position / duration,
            valueColor: AlwaysStoppedAnimation<Color>(colors.playedColor),
            backgroundColor: Colors.transparent,
          ),
        ],
      );
      progressIndicator = MouseRegion(
        onEnter: (PointerEnterEvent e) {
          setState(() {
            isHover = true;
          });
        },
        onHover: (e) {

        },
        onExit: (PointerExitEvent e) {
          setState(() {
            isHover = false;
          });
        },
        child: Container(
            height: maxHeight,
            child: Stack(
              alignment: Alignment.center,
              children: [
                progressIndicator,
                Positioned(
                    left: (position / duration) * buildWidth - maxHeight / 2,
                    child: Icon(
                      Icons.circle,
                      size: maxHeight,
                      color: colors.playedColor,
                    )),

              ],
            ).constrained(maxHeight: maxHeight)),
      );
    } else {
      progressIndicator = Container(
        height: maxHeight,
        alignment: Alignment.center,
        child: LinearProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(colors.playedColor),
          backgroundColor: colors.backgroundColor,
        ),
      );
    }

    Widget paddedProgressIndicator = Padding(
      padding: widget.padding,
      child: progressIndicator,
    );

    if (widget.allowScrubbing) {
      return MyVideoScrubber(
        controller: controller,
        child: paddedProgressIndicator,
      );
    } else {
      return paddedProgressIndicator;
    }
  }
}

import 'dart:async';

import 'package:animated_neumorphic/animated_neumorphic.dart';
import 'package:flutter/material.dart';

class NeuButton extends StatefulWidget {
  final Widget? child;
  final Text label;
  final double depth;
  final Color? color;
  final double? width;
  final double? height;
  final double radius;
  final Duration duration;
  final Curve curve;
  final GestureTapCallback? onTap;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Alignment aliment;

  const NeuButton(
      {super.key,
      this.child,
      this.onTap,
      this.depth = 0.5,
      this.label = const Text(""),
      this.color,
      this.width = 30,
      this.height = 30,
      this.radius = 8,
      this.duration = const Duration(milliseconds: 250),
      this.curve = Curves.easeInOut,
      this.aliment = Alignment.center,
      this.padding = const EdgeInsets.all(.0),
      this.margin = const EdgeInsets.symmetric(horizontal: 5)});

  @override
  State<NeuButton> createState() => _NeuButtonState();
}

class _NeuButtonState extends State<NeuButton> {
  double _depth = 0.5;
  double _width = 30.0;
  double _height = 30.0;
  // double _scale = 1.0;

  @override
  void initState() {
    _depth = widget.depth;
    _width = widget.width!;
    _height = widget.height!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ColoredBox? c = context.findAncestorWidgetOfExactType<ColoredBox>();
    Color? color;
    if (c != null) {
      color = c.color;
    }
    if (widget.color != null) {
      color = widget.color;
    }
    print("$c");
    return Container(
      margin: widget.margin,
      child: AnimatedNeumorphicContainer(
        depth: _depth,
        color: color ?? const Color(0xFFF2F2F2),
        width: _width,
        height: _height,
        radius: widget.radius,
        duration: const Duration(milliseconds: 100),
        child: Stack(
          children: [
            MouseRegion(
                onEnter: (e) {
                  setState(() {
                    _depth = 1;
                    // _scale = 1.05;
                  });
                },
                onExit: (e) {
                  setState(() {
                    _depth = widget.depth;
                    // _scale = 1.0;
                  });
                },
                child: Container(
                    width: _width,
                    height: _height,
                    padding: widget.padding,
                    alignment: widget.aliment,
                    child: widget.child)),
            GestureDetector(
              onTap: widget.onTap,
              onTapDown: (e) {
                setState(() {
                  _depth = 0;
                });
              },
              onTapUp: (e) {
                Timer(
                    const Duration(milliseconds: 200),
                    () => setState(() {
                          _depth = widget.depth;
                        }));
              },
            )
          ],
        ),
      ),
    );
  }
}

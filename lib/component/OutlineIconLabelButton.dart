import 'package:flutter/material.dart';

class OutlineIconLabelButton extends StatelessWidget {
  final Icon icon;
  final Text label;
  final VoidCallback onPress;

  const OutlineIconLabelButton(this.icon, this.label, this.onPress, {super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPress,
      style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(10),
          ),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          icon,
          const SizedBox(
            width: 10,
          ),
          label
        ],
      ),
    );
  }
}

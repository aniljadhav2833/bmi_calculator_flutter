import 'package:flutter/material.dart';

class LayoutItem extends StatelessWidget {
  const LayoutItem({
    super.key,
    required this.colour,
    this.childCard,
    this.onPress,
  });
  final Color colour;
  final Widget? childCard;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(10.0),
        child: childCard,
      ),
    );
  }
}

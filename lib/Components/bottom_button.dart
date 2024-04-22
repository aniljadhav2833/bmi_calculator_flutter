import 'package:flutter/material.dart';
import 'constant.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({super.key, required this.onTap, required this.title});

  final Function() onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: bottomContainColour,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(bottom: 20),
        width: double.infinity,
        height: bottomContainHeight,
        child: Center(
            child: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        )),
      ),
    );
  }
}

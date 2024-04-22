import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  const GenderCard(
      {super.key,
      required this.genderName,
      required this.genderIcon,
      required this.genderColor});
  final String genderName;
  final IconData genderIcon;
  final Color genderColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: 60,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          genderName,
          style: TextStyle(fontSize: 20, color: genderColor),
        )
      ],
    );
  }
}

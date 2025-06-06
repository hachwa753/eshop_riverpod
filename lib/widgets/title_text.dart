import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  const TitleText({
    super.key,
    required this.color,
    required this.fontSize,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}

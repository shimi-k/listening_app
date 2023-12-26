import 'package:flutter/material.dart';

class LoginViewText extends StatelessWidget {
  const LoginViewText({
    super.key,
    required this.text,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 14,
  });

  final String text;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}

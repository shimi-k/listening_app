import 'package:flutter/material.dart';

class CompTextButtonTransition extends StatelessWidget {
  const CompTextButtonTransition({
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    this.onPressed,
    super.key,
  });
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: backgroundColor,
          side: const BorderSide(
            color: Colors.black26,
          )),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
        ),
      ),
    );
  }
}

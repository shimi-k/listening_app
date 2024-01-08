import 'package:flutter/material.dart';

class CompTextIconButtonTransition extends StatelessWidget {
  const CompTextIconButtonTransition({
    required this.text,
    required this.icon,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
    super.key,
  });
  final String text;
  final Widget icon;
  final Color? backgroundColor;
  final Color? textColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: backgroundColor,
          side: const BorderSide(
            color: Colors.black26,
          )),
      onPressed: onPressed,
      icon: icon,
      label: Text(
        text,
        style: TextStyle(
          color: textColor,
        ),
      ),
    );
  }
}

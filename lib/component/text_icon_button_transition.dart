import 'package:flutter/material.dart';

class TextIconButtonTransition extends StatelessWidget {
  const TextIconButtonTransition({
    required this.text,
    required this.icon,
    required this.nextPageName,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
    super.key,
  });
  final String text;
  final Widget icon;
  final String nextPageName;
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
      // onPressed: () => Navigator.pushNamed(context, nextPageName),
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

import 'package:flutter/material.dart';

class TextButtonTransition extends StatelessWidget {
  const TextButtonTransition({
    required this.text,
    required this.nextPageName,
    required this.backgroundColor,
    required this.textColor,
    this.onPressed,
    super.key,
  });
  final String text;
  final String nextPageName;
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
      // onPressed: () => Navigator.pushNamed(context, nextPageName),
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

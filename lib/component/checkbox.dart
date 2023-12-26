import 'package:flutter/material.dart';

class CheckBox extends StatefulWidget {
  const CheckBox({super.key});

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool _flag = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: _flag,
      onChanged: (bool? value) {
        setState(() {
          _flag = value!;
        });
      },
    );
  }
}

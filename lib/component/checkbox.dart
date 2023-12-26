import 'package:flutter/material.dart';

class CompCheckBox extends StatefulWidget {
  const CompCheckBox({required this.callback, super.key});

  final VoidCallback? callback;

  @override
  State<CompCheckBox> createState() => _CompCheckBoxState();
}

class _CompCheckBoxState extends State<CompCheckBox> {
  bool _flag = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: _flag,
      onChanged: (bool? value) {
        setState(() {
          _flag = value!;
        });
        widget.callback;
      },
    );
  }
}

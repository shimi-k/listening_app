import 'package:flutter/material.dart';

class ToggleButton extends StatefulWidget {
  const ToggleButton({super.key});

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  final List<bool> _isSelected = [false, false];
  final String _text1 = '契約者ID';
  final String _text2 = '口座番号';

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      isSelected: _isSelected,
      onPressed: (index) {
        _isSelected[index] = !_isSelected[index];
      },
      children: [
        Text(_text1),
        Text(_text2),
      ],
    );
  }
}

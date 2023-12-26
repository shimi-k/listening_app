import 'package:flutter/material.dart';

class CompToggleButton extends StatefulWidget {
  const CompToggleButton({super.key});

  @override
  State<CompToggleButton> createState() => _CompToggleButtonState();
}

class _CompToggleButtonState extends State<CompToggleButton> {
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

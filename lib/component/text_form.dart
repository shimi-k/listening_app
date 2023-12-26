import 'package:flutter/material.dart';

class CompTextForm extends StatelessWidget {
  const CompTextForm({
    required this.textController,
    this.isObScureText = false,
    super.key,
  });
  final bool isObScureText;

  final TextEditingController textController;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObScureText,
      controller: textController,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () => textController.clear(),
          icon: const Icon(
            Icons.cancel,
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
      ),
    );
  }
}

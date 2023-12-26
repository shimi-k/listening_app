import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  const TextForm({
    required this.textController,
    super.key,
  });

  final TextEditingController textController;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
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

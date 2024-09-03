import 'package:flutter/material.dart';

class InputComponent extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Function(String?) validator;
  final TextInputType keyboardType;
  final Function() onTap;
  final bool isReadOnly;

  const InputComponent(
      {super.key,
      required this.controller,
      required this.label,
      required this.validator,
      required this.keyboardType,
      required this.onTap,
      required this.isReadOnly});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) => validator(value),
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: label,
          contentPadding: const EdgeInsets.all(12)),
      keyboardType: keyboardType,
      onTap: onTap,
      readOnly: isReadOnly,
      maxLines: 3,
      minLines: 1,
      onTapOutside: (focusNode) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }
}

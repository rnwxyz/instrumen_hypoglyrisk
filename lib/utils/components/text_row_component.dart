import 'package:flutter/material.dart';

class TextRowComponent extends StatelessWidget {
  final String title;
  final String data;
  final Widget? trailing;
  const TextRowComponent(
      {super.key, required this.data, required this.title, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Row(
          children: [
            Text(
              data,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            if (trailing != null) trailing!
          ],
        ),
      ],
    );
  }
}

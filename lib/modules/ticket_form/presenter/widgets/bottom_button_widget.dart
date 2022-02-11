import 'package:flutter/material.dart';

class BottomButtonWidget extends StatelessWidget {
  final String label;
  final TextStyle style;
  final VoidCallback? onPressed;

  const BottomButtonWidget({
    Key? key,
    required this.label,
    required this.style,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 80,
        child: OutlinedButton(
          child: Text(
            label,
            style: style,
          ),
          onPressed: onPressed ?? () {},
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomButtonWidget extends StatelessWidget {
  final String label;
  final TextStyle style;
  final VoidCallback? onPressed;

  const BottomButtonWidget({
    super.key,
    required this.label,
    required this.style,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: OutlinedButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: style,
        ),
      ),
    );
  }
}

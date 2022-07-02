import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../configs/app_colors.dart';

class ShimmerContainer extends StatelessWidget {
  final double? width;
  final double? height;

  const ShimmerContainer({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: AppColors.secondary,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(.2),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pay_flow/presenter/config/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonHomeWidget extends StatelessWidget {
  const SkeletonHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.orange,
      height: 184,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[600]!,
          highlightColor: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 12,
                    width: 120,
                    color: AppColors.body,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 12,
                    width: 200,
                    color: AppColors.body,
                  ),
                ],
              ),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.body,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

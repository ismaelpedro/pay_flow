import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

abstract class AppTextStyles {
  AppTextStyles._();

  static final TextStyle titleHome = TextStyle(
    fontFamily: 'LexendDeca',
    fontSize: 32.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.heading,
  );
  static final TextStyle titleRegular = TextStyle(
    fontFamily: 'LexendDeca',
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.background,
  );
  static final TextStyle titleBoldHeading = TextStyle(
    fontFamily: 'LexendDeca',
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.heading,
  );
  static final TextStyle titleBoldBackground = TextStyle(
    fontFamily: 'LexendDeca',
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.background,
  );
  static final TextStyle titleListTile = TextStyle(
    fontFamily: 'LexendDeca',
    fontSize: 17.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.heading,
  );
  static final TextStyle trailingRegular = TextStyle(
    fontFamily: 'LexendDeca',
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.heading,
  );
  static final TextStyle trailingBold = TextStyle(
    fontFamily: 'LexendDeca',
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.heading,
  );
  static final TextStyle buttonPrimary = TextStyle(
    fontFamily: 'Inter',
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.orange,
  );
  static final TextStyle buttonHeading = TextStyle(
    fontFamily: 'Inter',
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.heading,
  );
  static final TextStyle buttonGray = TextStyle(
    fontFamily: 'Inter',
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.grey,
  );
  static final TextStyle buttonBackground = TextStyle(
    fontFamily: 'Inter',
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.background,
  );
  static final TextStyle buttonBoldPrimary = TextStyle(
    fontFamily: 'Inter',
    fontSize: 15.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.orange,
  );
  static final TextStyle buttonBoldHeading = TextStyle(
    fontFamily: 'Inter',
    fontSize: 15.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.heading,
  );
  static final TextStyle buttonBoldGray = TextStyle(
    fontFamily: 'Inter',
    fontSize: 15.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.grey,
  );
  static final TextStyle buttonBoldBackground = TextStyle(
    fontFamily: 'Inter',
    fontSize: 15.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.background,
  );
  static final TextStyle captionBackground = TextStyle(
    fontFamily: 'Inter',
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.background,
  );
  static final TextStyle captionShape = TextStyle(
    fontFamily: 'Inter',
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.shape,
  );
  static final TextStyle captionBody = TextStyle(
    fontFamily: 'Inter',
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.body,
  );
  static final TextStyle captionBoldBackground = TextStyle(
    fontFamily: 'Inter',
    fontSize: 13.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.background,
  );
  static final TextStyle captionBoldShape = TextStyle(
    fontFamily: 'Inter',
    fontSize: 13.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.shape,
  );
  static final TextStyle captionBoldBody = TextStyle(
    fontFamily: 'Inter',
    fontSize: 13.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.body,
  );
}

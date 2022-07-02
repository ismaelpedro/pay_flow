import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

abstract class AppTextStyles {
  AppTextStyles._();

  static final titleHome = TextStyle(
    fontFamily: 'LexendDeca',
    fontSize: 32.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.heading,
  );
  static final titleRegular = TextStyle(
    fontFamily: 'LexendDeca',
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.background,
  );
  static final titleBoldHeading = TextStyle(
    fontFamily: 'LexendDeca',
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.heading,
  );
  static final titleBoldBackground = TextStyle(
    fontFamily: 'LexendDeca',
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.background,
  );
  static final titleListTile = TextStyle(
    fontFamily: 'LexendDeca',
    fontSize: 17.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.heading,
  );
  static final trailingRegular = TextStyle(
    fontFamily: 'LexendDeca',
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.heading,
  );
  static final trailingBold = TextStyle(
    fontFamily: 'LexendDeca',
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.heading,
  );
  static final buttonPrimary = TextStyle(
    fontFamily: 'Inter',
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.orange,
  );
  static final buttonHeading = TextStyle(
    fontFamily: 'Inter',
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.heading,
  );
  static final buttonGray = TextStyle(
    fontFamily: 'Inter',
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.grey,
  );
  static final buttonBackground = TextStyle(
    fontFamily: 'Inter',
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.background,
  );
  static final buttonBoldPrimary = TextStyle(
    fontFamily: 'Inter',
    fontSize: 15.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.orange,
  );
  static final buttonBoldHeading = TextStyle(
    fontFamily: 'Inter',
    fontSize: 15.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.heading,
  );
  static final buttonBoldGray = TextStyle(
    fontFamily: 'Inter',
    fontSize: 15.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.grey,
  );
  static final buttonBoldBackground = TextStyle(
    fontFamily: 'Inter',
    fontSize: 15.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.background,
  );
  static final captionBackground = TextStyle(
    fontFamily: 'Inter',
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.background,
  );
  static final captionShape = TextStyle(
    fontFamily: 'Inter',
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.shape,
  );
  static final captionBody = TextStyle(
    fontFamily: 'Inter',
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.body,
  );
  static final captionBoldBackground = TextStyle(
    fontFamily: 'Inter',
    fontSize: 13.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.background,
  );
  static final captionBoldShape = TextStyle(
    fontFamily: 'Inter',
    fontSize: 13.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.shape,
  );
  static final captionBoldBody = TextStyle(
    fontFamily: 'Inter',
    fontSize: 13.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.body,
  );
}

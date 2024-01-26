import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppTextStyles {
  AppTextStyles._();

  static const TextStyle titleHome = TextStyle(
    fontFamily: 'LexendDeca',
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: AppColors.heading,
  );
  static const TextStyle titleRegular = TextStyle(
    fontFamily: 'LexendDeca',
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: AppColors.background,
  );
  static const TextStyle titleBoldHeading = TextStyle(
    fontFamily: 'LexendDeca',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.heading,
  );
  static const TextStyle titleBoldBackground = TextStyle(
    fontFamily: 'LexendDeca',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.background,
  );
  static const TextStyle titleListTile = TextStyle(
    fontFamily: 'LexendDeca',
    fontSize: 17,
    fontWeight: FontWeight.w600,
    color: AppColors.heading,
  );
  static const TextStyle trailingRegular = TextStyle(
    fontFamily: 'LexendDeca',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.heading,
  );
  static const TextStyle trailingBold = TextStyle(
    fontFamily: 'LexendDeca',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.heading,
  );
  static const TextStyle buttonPrimary = TextStyle(
    fontFamily: 'Inter',
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColors.orange,
  );
  static const TextStyle buttonHeading = TextStyle(
    fontFamily: 'Inter',
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColors.heading,
  );
  static const TextStyle buttonGray = TextStyle(
    fontFamily: 'Inter',
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColors.grey,
  );
  static const TextStyle buttonBackground = TextStyle(
    fontFamily: 'Inter',
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColors.background,
  );
  static const TextStyle buttonBoldPrimary = TextStyle(
    fontFamily: 'Inter',
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: AppColors.orange,
  );
  static const TextStyle buttonBoldHeading = TextStyle(
    fontFamily: 'Inter',
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: AppColors.heading,
  );
  static const TextStyle buttonBoldGray = TextStyle(
    fontFamily: 'Inter',
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: AppColors.grey,
  );
  static const TextStyle buttonBoldBackground = TextStyle(
    fontFamily: 'Inter',
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: AppColors.background,
  );
  static const TextStyle captionBackground = TextStyle(
    fontFamily: 'Inter',
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.background,
  );
  static const TextStyle captionShape = TextStyle(
    fontFamily: 'Inter',
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.shape,
  );
  static const TextStyle captionBody = TextStyle(
    fontFamily: 'Inter',
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.body,
  );
  static const TextStyle captionBoldBackground = TextStyle(
    fontFamily: 'Inter',
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.background,
  );
  static const TextStyle captionBoldShape = TextStyle(
    fontFamily: 'Inter',
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.shape,
  );
  static const TextStyle captionBoldBody = TextStyle(
    fontFamily: 'Inter',
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.body,
  );
}

import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class AppTextStyles {
  AppTextStyles._();

  static const titleHome = TextStyle(
    fontFamily: 'LexendDeca',
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: AppColors.heading,
  );
  static const titleRegular = TextStyle(
    fontFamily: 'LexendDeca',
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: AppColors.background,
  );
  static const titleBoldHeading = TextStyle(
    fontFamily: 'LexendDeca',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.heading,
  );
  static const titleBoldBackground = TextStyle(
    fontFamily: 'LexendDeca',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.background,
  );
  static const titleListTile = TextStyle(
    fontFamily: 'LexendDeca',
    fontSize: 17,
    fontWeight: FontWeight.w600,
    color: AppColors.heading,
  );
  static const trailingRegular = TextStyle(
    fontFamily: 'LexendDeca',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.heading,
  );
  static const trailingBold = TextStyle(
    fontFamily: 'LexendDeca',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.heading,
  );
  static const buttonPrimary = TextStyle(
    fontFamily: 'Inter',
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColors.orange,
  );
  static const buttonHeading = TextStyle(
    fontFamily: 'Inter',
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColors.heading,
  );
  static const buttonGray = TextStyle(
    fontFamily: 'Inter',
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColors.grey,
  );
  static const buttonBackground = TextStyle(
    fontFamily: 'Inter',
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColors.background,
  );
  static const buttonBoldPrimary = TextStyle(
    fontFamily: 'Inter',
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: AppColors.orange,
  );
  static const buttonBoldHeading = TextStyle(
    fontFamily: 'Inter',
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: AppColors.heading,
  );
  static const buttonBoldGray = TextStyle(
    fontFamily: 'Inter',
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: AppColors.grey,
  );
  static const buttonBoldBackground = TextStyle(
    fontFamily: 'Inter',
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: AppColors.background,
  );
  static const captionBackground = TextStyle(
    fontFamily: 'Inter',
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.background,
  );
  static const captionShape = TextStyle(
    fontFamily: 'Inter',
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.shape,
  );
  static const captionBody = TextStyle(
    fontFamily: 'Inter',
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.body,
  );
  static const captionBoldBackground = TextStyle(
    fontFamily: 'Inter',
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.background,
  );
  static const captionBoldShape = TextStyle(
    fontFamily: 'Inter',
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.shape,
  );
  static const captionBoldBody = TextStyle(
    fontFamily: 'Inter',
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.body,
  );
}

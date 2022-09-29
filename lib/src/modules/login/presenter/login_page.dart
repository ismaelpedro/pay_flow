import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/presenter/assets/app_images.dart';
import '../../core/presenter/presenter.dart';
import '../../core/presenter/theme/app_colors.dart';
import '../../core/presenter/theme/app_text_styles.dart';
import 'widgets/translation_dropdown_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: 316.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.orange,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(60.h),
                      bottomRight: Radius.circular(60.h),
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10.h, right: 10.w),
                      child: const TranslationDropdownWidget(),
                    ),
                  ),
                ),
                SizedBox(height: 130.h),
                Image.asset(AppImages.logomini),
                SizedBox(height: 24.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 70.w),
                  child: Text(
                    context.i18n.loginTitleCenter,
                    style: AppTextStyles.titleHome,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 40.h),
                SizedBox(
                  width: 295.w,
                  height: 56.h,
                  child: ElevatedButton.icon(
                    icon: Image.asset(AppImages.google),
                    label: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 45.w),
                      child: Text(
                        context.i18n.loginButtonText,
                        style: AppTextStyles.buttonGray,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 3,
                      backgroundColor: AppColors.secondary,
                    ),
                    onPressed: () async {},
                  ),
                ),
                SizedBox(height: 40.h),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 300.h),
              child: Image.asset(
                AppImages.person,
                height: 300.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

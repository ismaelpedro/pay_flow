import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_flow/modules/login/presenter/login_controller.dart';

import '../../../../core/presenter/config/app_colors.dart';
import '../../../../core/presenter/config/app_images.dart';
import '../../../../core/presenter/config/app_text_styles.dart';
import '../../../../core/presenter/config/app_translations.dart';
import '../../../../core/presenter/widgets/translation_dropdown_widget.dart';

class LoginBodyWidget extends GetView<LoginController> {
  const LoginBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 316,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.orange,
              ),
              child: Container(
                alignment: Alignment.topRight,
                child: const Padding(
                  padding: EdgeInsets.only(top: 10, right: 10),
                  child: TranslationDropdownWidget(),
                ),
              ),
            ),
            const Spacer(),
            Image.asset(AppImages.logomini),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: Text(
                AppTranslationStrings.loginTitleCenter.tr,
                style: AppTextStyles.titleHome,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: 295,
              height: 56,
              child: ElevatedButton.icon(
                icon: Image.asset(AppImages.google),
                label: Padding(
                  padding: const EdgeInsets.only(left: 45, right: 45),
                  child: Text(
                    AppTranslationStrings.loginButtonText.tr,
                    style: AppTextStyles.buttonGray,
                    textAlign: TextAlign.center,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: AppColors.secondary,
                ),
                onPressed: () async {
                  await controller.login();
                },
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
        Positioned(
          top: 110,
          left: 0,
          right: 0,
          bottom: 372,
          child: Image.asset(AppImages.person),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_colors.dart';
import '../../../core/app_images.dart';
import '../../../core/app_text_styles.dart';
import '../../../core/app_translations.dart';
import '../../../shared/widgets/translation_dropdown_widget.dart';
import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
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
                  child: TranslationDropdownWidget(),
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
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.secondary,
                    ),
                    onPressed: () async {
                      await controller.loginWithGoogleUsecase();
                    }),
              ),
              const SizedBox(height: 80),
            ],
          ),
          Positioned(
            top: 70,
            left: 0,
            right: 0,
            bottom: 372,
            child: Image.asset(AppImages.person),
          ),
          Positioned(
            left: 59,
            bottom: 530,
            child: Image.asset(AppImages.add),
          ),
          Positioned(
            right: 65,
            bottom: 580,
            child: Image.asset(AppImages.doc),
          ),
        ],
      ),
    );
  }
}

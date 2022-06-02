import 'package:flutter/material.dart';

import '../../../core/presenter/config/app_colors.dart';
import '../../../core/presenter/config/app_images.dart';
import '../../../core/presenter/config/app_text_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/presenter/widgets/translation_dropdown_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 316,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.orange,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60),
                  ),
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
                  AppLocalizations.of(context)!.loginTitleCenter,
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
                    padding: const EdgeInsets.symmetric(horizontal: 45),
                    child: Text(
                      AppLocalizations.of(context)!.loginButtonText,
                      style: AppTextStyles.buttonGray,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 3,
                    primary: AppColors.secondary,
                  ),
                  onPressed: () async {},
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 300),
              child: Image.asset(
                AppImages.person,
                height: 300,
              ),
            ),
          ),
          // Positioned(
          //   top: 110,
          //   left: 0,
          //   right: 0,
          //   bottom: 372,
          //   child: Image.asset(AppImages.person),
          // ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_flow/core/app_text_styles.dart';

import '../../core/app_images.dart';
import '../../core/app_translations.dart';
import '../../modules/login/presenter/login_controller.dart';

class TranslationDropdownWidget extends StatelessWidget {
  TranslationDropdownWidget({Key? key}) : super(key: key);
  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DropdownButton<String>(
        style: AppTextStyles.titleListTile,
        elevation: 0,
        borderRadius: BorderRadius.circular(35),
        value: controller.dropdownvalue.value,
        items: [
          DropdownMenuItem(
            value: 'Português',
            child: Row(
              children: [
                Image.asset(
                  AppImages.br,
                  height: 35,
                  width: 35,
                ),
                const SizedBox(width: 10),
                Text(
                  AppTranslationStrings.ptBr.tr,
                ),
              ],
            ),
            onTap: () {
              Get.updateLocale(const Locale('pt', 'BR'));
            },
          ),
          DropdownMenuItem(
            value: 'Inglês',
            child: Row(
              children: [
                Image.asset(
                  AppImages.eua,
                  height: 35,
                  width: 35,
                ),
                const SizedBox(width: 10),
                Text(
                  AppTranslationStrings.enUS.tr,
                ),
              ],
            ),
            onTap: () {
              Get.updateLocale(const Locale('en', 'US'));
            },
          ),
        ],
        onChanged: (value) {
          controller.dropdownvalue.value = value!;
        },
      ),
    );
  }
}

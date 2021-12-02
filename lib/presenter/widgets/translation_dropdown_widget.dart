import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_flow/presenter/config/app_colors.dart';
import 'package:pay_flow/presenter/config/app_images.dart';
import 'package:pay_flow/presenter/config/app_translations.dart';
import 'package:pay_flow/presenter/modules/login/presenter/login_controller.dart';

class TranslationDropdownWidget extends StatelessWidget {
  final controller = Get.find<LoginController>();
  TranslationDropdownWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DropdownButton<String>(
        elevation: 0,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: AppColors.stroke,
        ),
        dropdownColor: AppColors.orange,
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

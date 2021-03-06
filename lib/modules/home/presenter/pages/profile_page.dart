import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pay_flow/core/presenter/app_controller.dart';
import 'package:pay_flow/core/presenter/config/app_images.dart';
import 'package:pay_flow/core/presenter/config/app_routes.dart';
import 'package:pay_flow/core/presenter/widgets/translation_dropdown_widget.dart';

import '../../../../core/presenter/config/app_colors.dart';
import '../../../../core/presenter/config/app_text_styles.dart';
import '../home_controller.dart';

class ProfilePage extends GetView<HomeController> {
  ProfilePage({Key? key}) : super(key: key);

  final appController = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('Perfil', style: AppTextStyles.titleBoldHeading),
        centerTitle: true,
        actions: const [
          TranslationDropdownWidget(),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(appController.currentUser.imageUrl!),
              ),
              const SizedBox(height: 20),
              Text(
                appController.currentUser.name,
                style: AppTextStyles.titleBoldHeading,
              ),
              const SizedBox(height: 10),
              Text(
                appController.currentUser.email,
                style: AppTextStyles.titleBoldHeading,
              ),
              const SizedBox(height: 20),
              const Divider(thickness: 2),
              const SizedBox(height: 20),
              // Obx(() {
              //   return CupertinoFormRow(
              //     padding: EdgeInsets.zero,
              //     child: CupertinoSwitch(
              //       activeColor: Colors.orange,
              //       value: appController.isDarkMode.value,
              //       onChanged: (value) {
              //         appController.isDarkMode.value = value;
              //         if (value) {
              //           Get.changeThemeMode(ThemeMode.dark);
              //         }
              //         Get.changeThemeMode(ThemeMode.light);
              //       },
              //     ),
              //     prefix: const Text(
              //       'Modo escuro',
              //       style: AppTextStyles.titleBoldHeading,
              //     ),
              //   );
              // }),
              Text(
                'Considere fazer uma doa????o :)',
                style: AppTextStyles.titleRegular.copyWith(
                  color: AppColors.heading,
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      await Clipboard.setData(const ClipboardData(
                          text: 'bc1qlm4knqc2t0xdqumfcsezqmcswvf282rlx5cq7r'));

                      Get.snackbar(
                        'Info.',
                        'C??digo Bitcoin copiado!',
                        snackPosition: SnackPosition.BOTTOM,
                        colorText: Colors.white,
                        backgroundColor: Colors.blue,
                      );
                    },
                    child: Image.asset(
                      AppImages.donateBtc,
                      height: 50,
                    ),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () async {
                      await Clipboard.setData(const ClipboardData(
                          text: '4483c72c-1b90-4b4f-b4b1-aac30aa078ed'));

                      Get.snackbar(
                        'Info.',
                        'Chave pix copiada!',
                        snackPosition: SnackPosition.BOTTOM,
                        colorText: Colors.white,
                        backgroundColor: Colors.blue,
                      );
                    },
                    child: Image.asset(
                      AppImages.pix,
                      height: 50,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text(
                    'Sair',
                    style: AppTextStyles.titleBoldHeading.copyWith(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  onPressed: () => Get.offAllNamed(Routes.login),
                ),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}

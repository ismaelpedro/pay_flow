import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/presenter/assets/app_images.dart';
import '../../../core/presenter/theme/app_colors.dart';
import '../../../core/presenter/theme/app_text_styles.dart';
import '../../../login/presenter/widgets/translation_dropdown_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Perfil',
          style: AppTextStyles.titleBoldHeading,
        ),
        centerTitle: true,
        actions: const <Widget>[
          TranslationDropdownWidget(),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.h),
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                // child: Image.network(appController.currentUser.imageUrl!),
              ),
              const SizedBox(height: 20),
              // Text(
              //   appController.currentUser.name,
              //   style: AppTextStyles.titleBoldHeading,
              // ),
              const SizedBox(height: 10),
              // Text(
              //   appController.currentUser.email,
              //   style: AppTextStyles.titleBoldHeading,
              // ),
              SizedBox(height: 20.h),
              const Divider(thickness: 2),
              SizedBox(height: 20.h),
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
                'Considere fazer uma doação :)',
                style: AppTextStyles.titleRegular.copyWith(
                  color: AppColors.heading,
                ),
              ),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () async {
                      await Clipboard.setData(
                        const ClipboardData(
                          text: 'bc1qlm4knqc2t0xdqumfcsezqmcswvf282rlx5cq7r',
                        ),
                      );
                    },
                    child: Image.asset(
                      AppImages.donateBtc,
                      height: 50.h,
                    ),
                  ),
                  SizedBox(width: 20.w),
                  GestureDetector(
                    onTap: () async {
                      await Clipboard.setData(
                        const ClipboardData(
                          text: '4483c72c-1b90-4b4f-b4b1-aac30aa078ed',
                        ),
                      );
                    },
                    child: Image.asset(
                      AppImages.pix,
                      height: 50.h,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  onPressed: () {},
                  child: Text(
                    'Sair',
                    style: AppTextStyles.titleBoldHeading.copyWith(
                      color: Colors.white,
                      fontSize: 20.sp,
                    ),
                  ),
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

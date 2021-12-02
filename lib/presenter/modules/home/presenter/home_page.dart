import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_flow/infra/dtos/user_dto.dart';
import 'package:pay_flow/presenter/config/app_colors.dart';
import 'package:pay_flow/presenter/config/app_text_styles.dart';
import 'package:pay_flow/presenter/config/app_translations.dart';
import 'package:pay_flow/presenter/modules/home/presenter/widgets/skeleton_home_widget.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);
  final UserDto user = Get.arguments;

  waiting() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(
            future: waiting(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SkeletonHomeWidget();
              }
              return Container(
                color: AppColors.orange,
                height: 184,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                              text: AppTranslationStrings.hello.tr,
                              style: AppTextStyles.titleRegular,
                              children: [
                                TextSpan(
                                  text: user.returnFirstNameOnly,
                                  style: AppTextStyles.titleBoldBackground,
                                ),
                              ],
                            ),
                          ),
                          Text(
                            AppTranslationStrings.accountUpTodate.tr,
                            style: AppTextStyles.captionShape,
                          ),
                        ],
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          user.imageUrl!,
                          height: 60,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

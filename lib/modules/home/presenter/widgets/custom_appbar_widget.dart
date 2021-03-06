import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/domain/entities/user_entity.dart';
import '../../../../core/presenter/app_controller.dart';
import '../../../../core/presenter/config/app_colors.dart';
import '../../../../core/presenter/config/app_images.dart';
import '../../../../core/presenter/config/app_text_styles.dart';
import '../../../../core/presenter/config/app_translations.dart';

class CustomAppBarWidget extends StatelessWidget {
  final UserEntity user;

  const CustomAppBarWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          children: [
            Container(
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
                                text: user.firstNameOnly,
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
                      child: CachedNetworkImage(
                        height: 60,
                        imageUrl: user.imageUrl!,
                        placeholder: (_, error) {
                          return const CupertinoActivityIndicator();
                        },
                        errorWidget: (_, __, error) {
                          return const Icon(Icons.error);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 40,
              color: Colors.white,
            ),
          ],
        ),
        Positioned(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              height: 80,
              // width: 327,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  Image.asset(
                    AppImages.logomini,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 24),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: VerticalDivider(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  const SizedBox(width: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(() {
                        return RichText(
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            text: AppTranslationStrings.youHave.tr,
                            style: AppTextStyles.captionShape,
                            children: [
                              TextSpan(
                                text:
                                    '${Get.find<AppController>().tickets.length} ${AppTranslationStrings.tickets.tr}',
                                style: AppTextStyles.captionBoldBackground,
                              ),
                            ],
                          ),
                        );
                      }),
                      Text(
                        AppTranslationStrings.registrationsToPay.tr,
                        style: AppTextStyles.captionShape,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_flow/infra/dtos/user_dto.dart';
import 'package:pay_flow/presenter/config/app_colors.dart';
import 'package:pay_flow/presenter/config/app_images.dart';
import 'package:pay_flow/presenter/config/app_text_styles.dart';
import 'package:pay_flow/presenter/config/app_translations.dart';

class CustomAppBar extends StatelessWidget {
  final UserDto user;
  final int ticketsCount = 1;

  const CustomAppBar({Key? key, required this.user}) : super(key: key);

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
                      child: Image.network(
                        user.imageUrl!,
                        height: 60,
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
                      RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          text: AppTranslationStrings.youHave.tr,
                          style: AppTextStyles.captionShape,
                          children: [
                            TextSpan(
                              text:
                                  '$ticketsCount ${AppTranslationStrings.tickets.tr}',
                              style: AppTextStyles.captionBoldBackground,
                            ),
                          ],
                        ),
                      ),
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

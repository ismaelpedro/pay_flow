import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/domain/entities/user_entity.dart';
import '../../../../core/presenter/config/app_colors.dart';
import '../../../../core/presenter/config/app_images.dart';
import '../../../../core/presenter/config/app_text_styles.dart';

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
                            text: 'AppTranslationStrings.hello.tr',
                            style: AppTextStyles.titleRegular,
                            children: [
                              TextSpan(
                                text: user.firstNameOnly,
                                style: AppTextStyles.titleBoldBackground,
                              ),
                            ],
                          ),
                        ),
                        const Text(
                          'AppTranslationStrings.accountUpTodate.tr',
                          style: AppTextStyles.captionShape,
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        color: Colors.grey[200],
                        child: Image.network(
                          user.imageUrl!,
                          loadingBuilder: (_, child, progress) {
                            if (progress == null) {
                              return child;
                            }
                            return const Center(
                                child: CupertinoActivityIndicator());
                          },
                          height: 60,
                          width: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(height: 40, color: Colors.white),
          ],
        ),
        Positioned(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              height: 80,
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
                        text: const TextSpan(
                          text: ' AppTranslationStrings.youHave.tr',
                          style: AppTextStyles.captionShape,
                          children: [
                            TextSpan(
                              text: '1',
                              style: AppTextStyles.captionBoldBackground,
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        'AppTranslationStrings.registrationsToPay.tr',
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

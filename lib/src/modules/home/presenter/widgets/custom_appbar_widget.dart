import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/domain/domain.dart';
import '../../../core/presenter/assets/app_images.dart';
import '../../../core/presenter/theme/app_colors.dart';
import '../../../core/presenter/theme/app_text_styles.dart';


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
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              color: AppColors.orange,
              height: 184.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        RichText(
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            text: 'Olá, ',
                            style: AppTextStyles.titleRegular,
                            children: <InlineSpan>[
                              TextSpan(
                                text: user.firstName,
                                style: AppTextStyles.titleBoldBackground,
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'Mantenha suas contas em dia',
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
                          loadingBuilder:
                              (_, Widget child, ImageChunkEvent? progress) {
                            if (progress == null) {
                              return child;
                            }
                            return const Center(
                              child: CupertinoActivityIndicator(),
                            );
                          },
                          height: 60.h,
                          width: 60.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 40.h,
              color: Colors.white,
            ),
          ],
        ),
        Positioned(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              height: 80.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: <Widget>[
                  SizedBox(width: 20.w),
                  Image.asset(
                    AppImages.logomini,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 24),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.h),
                    child: VerticalDivider(
                      color: Colors.white,
                      width: 2.w,
                    ),
                  ),
                  SizedBox(width: 24.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          text: 'Voce tem ',
                          style: AppTextStyles.captionShape,
                          children: <InlineSpan>[
                            TextSpan(
                              text: '2 boletos',
                              style: AppTextStyles.captionBoldBackground,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'cadastrados para pagar',
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

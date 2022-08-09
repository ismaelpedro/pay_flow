import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/presenter/assets/app_images.dart';
import '../../../core/presenter/presenter.dart';
import '../../../core/presenter/theme/app_colors.dart';
import '../../../core/presenter/theme/app_text_styles.dart';

class SkeletonHomeWidget extends StatelessWidget {
  const SkeletonHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;

    return SizedBox(
      width: mediaQuery.width,
      height: mediaQuery.height,
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    color: AppColors.orange,
                    height: 184.h,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ShimmerContainer(
                                height: 10.h,
                                width: 200.w,
                              ),
                              Column(
                                children: <Widget>[
                                  SizedBox(height: 5.h),
                                  ShimmerContainer(
                                    height: 10.h,
                                    width: 200.w,
                                  ),
                                ],
                              )
                            ],
                          ),
                          const Spacer(),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: ShimmerContainer(
                              height: 60.h,
                              width: 60.w,
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
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Container(
                    height: 80.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 24.w),
                        Image.asset(
                          AppImages.logomini,
                          color: Colors.white,
                        ),
                        SizedBox(width: 24.w),
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
                            ShimmerContainer(
                              height: 10.h,
                              width: 170.w,
                            ),
                            SizedBox(height: 5.h),
                            ShimmerContainer(
                              height: 10.h,
                              width: 170.w,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 32.h),
                  ShimmerContainer(
                    child: Text(
                      'AppTranslationStrings.myTickets.tr',
                      style: AppTextStyles.titleBoldHeading,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  const Divider(thickness: 2),
                  Expanded(
                    child: Scrollbar(
                      thumbVisibility: true,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: 6,
                        itemBuilder: (_, int index) {
                          return ListTile(
                            title: const ShimmerContainer(
                              height: 10,
                              width: 50,
                            ),
                            subtitle: ShimmerContainer(
                              height: 10.h,
                              width: 50.w,
                            ),
                            trailing: ShimmerContainer(
                              height: 10.h,
                              width: 100.w,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

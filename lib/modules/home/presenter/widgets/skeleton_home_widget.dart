import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/presenter/assets/app_images.dart';
import '../../../../core/presenter/theme/app_colors.dart';
import '../../../../core/presenter/theme/app_text_styles.dart';


class SkeletonHomeWidget extends StatelessWidget {
  const SkeletonHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return SizedBox(
      width: mediaQuery.width,
      height: mediaQuery.height,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                children: [
                  Container(
                    color: AppColors.orange,
                    height: 184.h,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10.h,
                                width: 200.w,
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey[350]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: Container(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(height: 5.h),
                                  SizedBox(
                                    height: 10.h,
                                    width: 200.w,
                                    child: Shimmer.fromColors(
                                      baseColor: Colors.grey[350]!,
                                      highlightColor: Colors.grey[100]!,
                                      child: Container(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const Spacer(),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: SizedBox(
                              height: 60.h,
                              width: 60.w,
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey[350]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  color: Colors.white,
                                ),
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
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Container(
                    height: 80.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
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
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey[350]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                color: Colors.white,
                                height: 10.h,
                                width: 170.w,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Shimmer.fromColors(
                              baseColor: Colors.grey[350]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                color: Colors.white,
                                height: 10.h,
                                width: 170.w,
                              ),
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
                children: [
                  SizedBox(height: 32.h),
                  Shimmer.fromColors(
                    baseColor: Colors.grey[350]!,
                    highlightColor: Colors.grey[100]!,
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
                        itemBuilder: (_, index) {
                          return ListTile(
                            title: SizedBox(
                              height: 10,
                              width: 50,
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey[350]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            subtitle: SizedBox(
                              height: 10.h,
                              width: 50.w,
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey[350]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            trailing: SizedBox(
                              height: 10.h,
                              width: 100.w,
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey[350]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  color: Colors.white,
                                ),
                              ),
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

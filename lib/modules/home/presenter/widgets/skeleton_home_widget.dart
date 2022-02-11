import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/presenter/config/app_colors.dart';
import '../../../../core/presenter/config/app_images.dart';
import '../../../../core/presenter/config/app_text_styles.dart';
import '../../../../core/presenter/config/app_translations.dart';



class SkeletonHomeWidget extends StatelessWidget {
  const SkeletonHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: Column(
        children: [
          Stack(
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
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                                width: 200,
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
                                  const SizedBox(height: 5),
                                  SizedBox(
                                    height: 10,
                                    width: 200,
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
                              height: 60,
                              width: 60,
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
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 24),
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
                            Shimmer.fromColors(
                              baseColor: Colors.grey[350]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                color: Colors.white,
                                height: 10,
                                width: 170,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Shimmer.fromColors(
                              baseColor: Colors.grey[350]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                color: Colors.white,
                                height: 10,
                                width: 170,
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
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 32),
                  Shimmer.fromColors(
                    baseColor: Colors.grey[350]!,
                    highlightColor: Colors.grey[100]!,
                    child: Text(
                      AppTranslationStrings.myTickets.tr,
                      style: AppTextStyles.titleBoldHeading,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Divider(thickness: 2),
                  Expanded(
                    child: Scrollbar(
                      isAlwaysShown: true,
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
                            trailing: SizedBox(
                              height: 10,
                              width: 100,
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

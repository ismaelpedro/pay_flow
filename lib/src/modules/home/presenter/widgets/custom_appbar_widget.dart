import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_flow/src/modules/core/core.dart';
import 'package:pay_flow/src/modules/core/infrastructure/service_locator/service_locator.dart';

class CustomAppBarWidget extends StatefulWidget {
  const CustomAppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomAppBarWidget> createState() => _CustomAppBarWidgetState();
}

class _CustomAppBarWidgetState extends State<CustomAppBarWidget> {
  late AppStore _appStore;

  @override
  void initState() {
    _appStore = serviceLocator.get<AppStore>();
    super.initState();
  }

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
                          text: context.i18n.hello(
                            name: TextSpan(
                              text: _appStore.user!.name,
                              style: AppTextStyles.titleBoldBackground,
                            ),
                          ),
                        ),
                        Text(
                          context.i18n.accountUpTodate,
                          style: AppTextStyles.captionShape,
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        height: 60,
                        width: 60,
                        color: Colors.grey[200],
                        child: Image.network(
                          _appStore.user!.imageUrl,
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
                          text: context.i18n.youHave,
                          style: AppTextStyles.captionShape,
                          children: <InlineSpan>[
                            TextSpan(
                              text: '',
                              style: AppTextStyles.captionBoldBackground,
                            ),
                            TextSpan(
                              text: context.i18n.registrationsToPay,
                              style: AppTextStyles.captionBoldBackground,
                            ),
                          ],
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
    );
  }
}

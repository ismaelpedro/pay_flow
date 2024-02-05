import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/infrastructure/auth/auth_service.dart';
import '../../../../core/infrastructure/service_locator/service_locator.dart';
import '../../../../core/presenter/assets/assets.dart';
import '../../../../core/presenter/extensions/extensions.dart';
import '../../../../core/presenter/ui/theme/app_colors.dart';
import '../../../../core/presenter/ui/theme/app_text_styles.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  late AuthService authService;

  @override
  void initState() {
    authService = locator.get<AuthService>();
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
              color: context.theme.primaryColor,
              height: 184,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            text: authService.user?.displayName ?? '',
                            style: AppTextStyles.titleBoldBackground,
                          ),
                        ),
                        Text(
                          context.localizations.accountUpTodate,
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
                        child: CachedNetworkImage(
                          imageUrl: authService.user?.photoURL ?? '',
                          progressIndicatorBuilder: (_, __, ___) {
                            return const Center(child: CupertinoActivityIndicator());
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
                children: <Widget>[
                  const SizedBox(width: 20),
                  SvgPicture.asset(AppImages.logomini),
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
                    children: <Widget>[
                      RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          text: context.localizations.registrationsToPay(0),
                          style: AppTextStyles.captionShape,
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

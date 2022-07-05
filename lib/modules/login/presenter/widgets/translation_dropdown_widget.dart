import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/presenter/app_controller.dart';
import '../../../../core/presenter/assets/app_images.dart';

class TranslationDropdownWidget extends StatelessWidget {
  const TranslationDropdownWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appController = GetIt.I.get<AppController>();

    return SafeArea(
      child: PopupMenuButton(
        key: const ValueKey('pt-option'),
        tooltip: '',
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        itemBuilder: (context) {
          return [
            PopupMenuItem(
              value: 1,
              child: Row(
                children: [
                  Image.asset(
                    AppImages.br,
                    height: 35.h,
                    width: 35.w,
                  ),
                  const SizedBox(width: 10),
                  Text(AppLocalizations.of(context)!.ptBr),
                ],
              ),
              onTap: () {
                appController.setLocale(const Locale('pt', 'BR'));
              },
            ),
            PopupMenuItem(
              value: 2,
              child: Row(
                children: [
                  Image.asset(
                    AppImages.eua,
                    height: 35,
                    width: 35,
                  ),
                  SizedBox(width: 10.w),
                  Text(AppLocalizations.of(context)!.enUS),
                ],
              ),
              onTap: () {
                appController.setLocale(const Locale('en', 'US'));
              },
            ),
            PopupMenuItem(
              value: 3,
              child: Row(
                children: [
                  Image.asset(
                    AppImages.es,
                    height: 35.h,
                    width: 35.w,
                  ),
                  SizedBox(width: 10.w),
                  Text(AppLocalizations.of(context)!.esES),
                ],
              ),
              onTap: () {
                appController.setLocale(const Locale('es', 'ES'));
              },
            ),
          ];
        },
      ),
    );
  }
}

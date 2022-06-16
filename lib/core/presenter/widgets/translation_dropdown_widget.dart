import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import '../app_controller.dart';
import '../config/app_images.dart';

class TranslationDropdownWidget extends StatelessWidget {
  const TranslationDropdownWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final getIt = GetIt.I;

    return SafeArea(
      child: PopupMenuButton(
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
                    height: 35,
                    width: 35,
                  ),
                  const SizedBox(width: 10),
                  Text(AppLocalizations.of(context)!.ptBr),
                ],
              ),
              onTap: () {
                getIt.get<AppController>().setLocale(const Locale('pt', 'BR'));
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
                  const SizedBox(width: 10),
                  Text(AppLocalizations.of(context)!.enUS),
                ],
              ),
              onTap: () {
                getIt.get<AppController>().setLocale(const Locale('en', 'US'));
              },
            ),
            PopupMenuItem(
              value: 3,
              child: Row(
                children: [
                  Image.asset(
                    AppImages.es,
                    height: 35,
                    width: 35,
                  ),
                  const SizedBox(width: 10),
                  Text(AppLocalizations.of(context)!.esES),
                ],
              ),
              onTap: () {
                getIt.get<AppController>().setLocale(const Locale('es', 'ES'));
              },
            ),
          ];
        },
      ),
    );
  }
}

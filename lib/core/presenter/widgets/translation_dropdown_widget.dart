import 'package:flutter/material.dart';

import '../config/app_images.dart';

class TranslationDropdownWidget extends StatelessWidget {
  const TranslationDropdownWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  const Text('AppTranslationStrings.ptBr.tr'),
                ],
              ),
              onTap: () {},
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
                  const Text('AppTranslationStrings.enUS.tr'),
                ],
              ),
              onTap: () {},
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
                  const Text('AppTranslationStrings.esES.tr'),
                ],
              ),
              onTap: () {},
            ),
          ];
        },
      ),
    );
  }
}

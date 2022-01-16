import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../config/app_routes.dart';
import '../../../config/app_translations.dart';
import '../home_controller.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(AppTranslationStrings.warning.tr),
      content: Text(AppTranslationStrings.registerTicket.tr),
      actions: [
        CupertinoDialogAction(
          child: Text(AppTranslationStrings.scan.tr),
          onPressed: () async {
            Get.back();
            await Get.find<HomeController>().scanBarCode();
          },
        ),
        CupertinoDialogAction(
          child: Text(AppTranslationStrings.manually.tr),
          onPressed: () async {
            Get.back();
            Get.toNamed(Routes.ticketForm);
          },
        ),
      ],
    );
  }
}

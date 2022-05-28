import 'package:flutter/cupertino.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('AppTranslationStrings.warning.tr'),
      content: const Text('AppTranslationStrings.registerTicket.tr'),
      actions: [
        CupertinoDialogAction(
          child: const Text('AppTranslationStrings.scan.tr'),
          onPressed: () async {
            // await Get.find<HomeController>().scanBarCode();
          },
        ),
        CupertinoDialogAction(
          child: const Text('AppTranslationStrings.manually.tr'),
          onPressed: () async {},
        ),
      ],
    );
  }
}

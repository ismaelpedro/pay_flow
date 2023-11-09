import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core.dart';

class TranslationDropdownWidget extends StatelessWidget {
  final Color? color;

  const TranslationDropdownWidget({
    super.key,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      enableFeedback: true,
      value: context.i18n.ptBr,
      onChanged: (value) {},
      items: [
        DropdownMenuItem(
          value: context.i18n.ptBr,
          child: Row(
            children: <Widget>[
              Image.asset(
                AppImages.br,
                height: 25.h,
                width: 25.w,
              ),
              const SizedBox(width: 10),
              Text(context.i18n.ptBr),
            ],
          ),
        ),
        DropdownMenuItem(
          value: context.i18n.enUS,
          child: Row(
            children: <Widget>[
              Image.asset(
                AppImages.eua,
                height: 25,
                width: 25,
              ),
              SizedBox(width: 10.w),
              Text(context.i18n.enUS),
            ],
          ),
        ),
        DropdownMenuItem(
          value: context.i18n.esES,
          child: Row(
            children: <Widget>[
              Image.asset(
                AppImages.es,
                height: 25.h,
                width: 25.w,
              ),
              SizedBox(width: 10.w),
              Text(context.i18n.esES),
            ],
          ),
        ),
      ],
    );
  }
}

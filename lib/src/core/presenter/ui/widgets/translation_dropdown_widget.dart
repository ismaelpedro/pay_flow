import 'package:flutter/material.dart';
import '../../assets/assets.dart';
import '../../extensions/extensions.dart';

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
      value: context.localizations.ptBr,
      onChanged: (value) {},
      items: [
        DropdownMenuItem(
          value: context.localizations.ptBr,
          child: Row(
            children: <Widget>[
              Image.asset(
                AppImages.br,
                height: 25,
                width: 25,
              ),
              const SizedBox(width: 10),
              Text(context.localizations.ptBr),
            ],
          ),
        ),
        DropdownMenuItem(
          value: context.localizations.enUS,
          child: Row(
            children: <Widget>[
              Image.asset(
                AppImages.eua,
                height: 25,
                width: 25,
              ),
              const SizedBox(width: 10),
              Text(context.localizations.enUS),
            ],
          ),
        ),
        DropdownMenuItem(
          value: context.localizations.esES,
          child: Row(
            children: <Widget>[
              Image.asset(
                AppImages.es,
                height: 25,
                width: 25,
              ),
              const SizedBox(width: 10),
              Text(context.localizations.esES),
            ],
          ),
        ),
      ],
    );
  }
}

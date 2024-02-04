import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../pay_flow_app.dart';
import '../../assets/assets.dart';
import '../../extensions/extensions.dart';

class TranslationDropdownWidget extends StatefulWidget {
  const TranslationDropdownWidget({
    super.key,
  });

  @override
  State<TranslationDropdownWidget> createState() => _TranslationDropdownWidgetState();
}

class _TranslationDropdownWidgetState extends State<TranslationDropdownWidget> {
  late String currentLang;
  late PayFlowAppState? appState;

  @override
  void didChangeDependencies() {
    appState = context.findAncestorStateOfType<PayFlowAppState>();
    currentLang = appState?.appLocale?.languageCode ?? 'en';
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.orange, width: 1),
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          buttonTheme: ButtonTheme.of(context).copyWith(alignedDropdown: true),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            enableFeedback: true,
            value: currentLang,
            icon: const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.orange,
            ),
            onChanged: (String? newValue) {
              appState?.setLocale(Locale(newValue!));
              setState(() => currentLang = newValue!);
            },
            items: [
              DropdownMenuItem(
                value: 'pt',
                child: Row(
                  children: <Widget>[
                    SvgPicture.asset(
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
                value: 'en',
                child: Row(
                  children: <Widget>[
                    SvgPicture.asset(
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
                value: 'es',
                child: Row(
                  children: <Widget>[
                    SvgPicture.asset(
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
          ),
        ),
      ),
    );
  }
}

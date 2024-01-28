import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/presenter/extensions/extensions.dart';
import '../../../../core/presenter/ui/theme/app_colors.dart';
import '../../../../core/presenter/ui/theme/app_text_styles.dart';

class TileFormWidget extends StatelessWidget {
  final String hintText;
  final String imagePrefix;
  final String? initialValue;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool readOnly;

  const TileFormWidget({
    super.key,
    this.initialValue,
    required this.onChanged,
    required this.imagePrefix,
    required this.hintText,
    required thisintText,
    this.controller,
    this.validator,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextFormField(
              initialValue: initialValue,
              onChanged: onChanged,
              readOnly: readOnly,
              validator: validator,
              controller: controller,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: <String>[
                context.localizations.value,
                context.localizations.expiration,
                context.localizations.code,
              ].contains(hintText)
                  ? TextInputType.number
                  : null,
              inputFormatters: <String>[
                context.localizations.value,
                context.localizations.code,
              ].contains(hintText)
                  ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
                  : null,
              decoration: InputDecoration(
                counterText: '',
                hintText: hintText,
                hintStyle: AppTextStyles.buttonGray,
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset(imagePrefix),
                        const SizedBox(width: 15),
                        const VerticalDivider(
                          thickness: 1.5,
                          color: AppColors.input,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

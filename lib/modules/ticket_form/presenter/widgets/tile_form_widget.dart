import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pay_flow/modules/ticket_form/presenter/ticket_form_controller.dart';

import '../../../../core/presenter/config/app_colors.dart';
import '../../../../core/presenter/config/app_text_styles.dart';
import '../../../../core/presenter/config/app_translations.dart';

class TileFormWidget extends GetView<TicketFormController> {
  final String hintText;
  final String imagePrefix;
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;
  final bool readOnly;

  const TileFormWidget({
    Key? key,
    required this.imagePrefix,
    required this.hintText,
    required this.textEditingController,
    this.validator,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              readOnly: readOnly,
              validator: validator,
              controller: textEditingController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: [
                AppTranslationStrings.value.tr,
                AppTranslationStrings.expiration.tr
              ].contains(hintText)
                  ? TextInputType.number
                  : null,
              inputFormatters: [
                AppTranslationStrings.value.tr,
                AppTranslationStrings.expiration.tr,
              ].contains(hintText)
                  ? [FilteringTextInputFormatter.digitsOnly]
                  : null,
              maxLength:
                  [AppTranslationStrings.expiration.tr].contains(hintText)
                      ? 10
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
                      children: [
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

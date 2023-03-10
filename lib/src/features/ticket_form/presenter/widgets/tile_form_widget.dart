import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_flow/src/core/core.dart';

class TileFormWidget extends StatelessWidget {
  final String hintText;
  final String imagePrefix;
  final String? initialValue;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool readOnly;

  const TileFormWidget({
    Key? key,
    this.initialValue,
    required this.onChanged,
    required this.imagePrefix,
    required this.hintText,
    this.controller,
    this.validator,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 25.h),
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
                context.i18n.value,
                context.i18n.expiration,
                context.i18n.code
              ].contains(hintText)
                  ? TextInputType.number
                  : null,
              inputFormatters: <String>[
                context.i18n.value,
                context.i18n.code,
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
                        SizedBox(width: 15.w),
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

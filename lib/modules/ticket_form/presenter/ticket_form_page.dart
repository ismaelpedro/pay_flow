import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/presenter/configs/app_colors.dart';
import '../../../core/presenter/configs/app_images.dart';
import '../../../core/presenter/configs/app_text_styles.dart';
import 'widgets/bottom_button_widget.dart';
import 'widgets/tile_form_widget.dart';

class TicketFormPage extends StatefulWidget {
  const TicketFormPage({Key? key}) : super(key: key);

  @override
  State<TicketFormPage> createState() => _TicketFormPageState();
}

class _TicketFormPageState extends State<TicketFormPage> {
  final nameEC = TextEditingController();
  final valueEC = TextEditingController();
  final expirationEC = TextEditingController();
  final codeEC = TextEditingController();

  @override
  void dispose() {
    nameEC.dispose();
    expirationEC.dispose();
    valueEC.dispose();
    codeEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.background,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.grey,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Text(
                  'AppTranslationStrings.fillTickets.tr',
                  style: AppTextStyles.titleBoldHeading,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 40.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Form(
                  child: Column(
                    children: [
                      TileFormWidget(
                        imagePrefix: AppImages.ticket,
                        hintText: 'AppTranslationStrings.ticket.tr',
                        textEditingController: nameEC,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Nome obrigatório';
                          }
                          return null;
                        },
                      ),
                      InkWell(
                        onTap: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (builder) {
                              return SizedBox(
                                height: 255.h,
                                width: double.infinity,
                                child: CupertinoDatePicker(
                                  backgroundColor: Colors.white,
                                  mode: CupertinoDatePickerMode.date,
                                  onDateTimeChanged: (value) {
                                    // controller.expirationEC.text =
                                    //     DateFormat('dd/MM/yyyy').format(value);
                                  },
                                ),
                              );
                            },
                          );
                        },
                        child: AbsorbPointer(
                          child: TileFormWidget(
                            readOnly: true,
                            imagePrefix: AppImages.close,
                            hintText: 'AppTranslationStrings.expiration.tr',
                            textEditingController: expirationEC,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Vencimento obrigatório';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      TileFormWidget(
                        imagePrefix: AppImages.wallet,
                        hintText: 'AppTranslationStrings.value.tr',
                        textEditingController: valueEC,
                        validator: (value) {
                          if (value!.isEmpty || value == 'R\$ 0,00') {
                            return 'Valor obrigatório';
                          }
                          return null;
                        },
                      ),
                      TileFormWidget(
                        imagePrefix: AppImages.barcode,
                        hintText: 'AppTranslationStrings.code.tr',
                        textEditingController: codeEC,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Código obrigatório';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Row(
          children: [
            BottomButtonWidget(
              label: 'AppTranslationStrings.cancel.tr',
              style: AppTextStyles.buttonGray,
              onPressed: () => Navigator.pop(context),
            ),
            BottomButtonWidget(
              label: 'AppTranslationStrings.register.tr',
              style: AppTextStyles.buttonPrimary,
              onPressed: () async {
                // if (controller.formKey.currentState!.validate()) {
                //   final ticket = TicketEntity(
                //     id: const Uuid().v4(),
                //     name: nameEC.text,
                //     date: expirationEC.text,
                //     code: codeEC.text,
                //     value: valueEC.text,
                //   );

                //   Get.find<AppController>().tickets.add(ticket);
                //   Get.back();
                // }
              },
            ),
          ],
        ),
      ),
    );
  }
}

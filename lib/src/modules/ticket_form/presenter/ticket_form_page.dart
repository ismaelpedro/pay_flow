import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../core/presenter/assets/app_images.dart';
import '../../core/presenter/theme/app_colors.dart';
import '../../core/presenter/theme/app_text_styles.dart';
import 'widgets/bottom_button_widget.dart';
import 'widgets/tile_form_widget.dart';

class TicketFormPage extends StatefulWidget {
  const TicketFormPage({Key? key}) : super(key: key);

  @override
  State<TicketFormPage> createState() => _TicketFormPageState();
}

class _TicketFormPageState extends State<TicketFormPage> {
  TextEditingController nameEC = TextEditingController();
  TextEditingController valueEC = TextEditingController();
  TextEditingController expirationEC = TextEditingController();
  TextEditingController codeEC = TextEditingController();

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
            children: <Widget>[
              Center(
                child: Text(
                  'Preencha os dados\ndo boleto',
                  style: AppTextStyles.titleBoldHeading,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 40.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Form(
                  child: Column(
                    children: <Widget>[
                      TileFormWidget(
                        imagePrefix: AppImages.ticket,
                        hintText: 'Nome do boleto',
                        textEditingController: nameEC,
                        validator: (String? value) {
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
                            builder: (BuildContext builder) {
                              return SizedBox(
                                height: 255.h,
                                width: double.infinity,
                                child: CupertinoDatePicker(
                                  backgroundColor: Colors.white,
                                  mode: CupertinoDatePickerMode.date,
                                  onDateTimeChanged: (DateTime value) {
                                    expirationEC.text =
                                        DateFormat('dd/MM/yyyy').format(value);
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
                            hintText: 'Vencimento',
                            textEditingController: expirationEC,
                            validator: (String? value) {
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
                        hintText: 'Valor',
                        textEditingController: valueEC,
                        validator: (String? value) {
                          if (value!.isEmpty || value == 'R\$ 0,00') {
                            return 'Valor obrigatório';
                          }
                          return null;
                        },
                      ),
                      TileFormWidget(
                        imagePrefix: AppImages.barcode,
                        hintText: 'Código',
                        textEditingController: codeEC,
                        validator: (String? value) {
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
          children: <Widget>[
            BottomButtonWidget(
              label: 'Cancelar',
              style: AppTextStyles.buttonGray,
              onPressed: () => Navigator.pop(context),
            ),
            BottomButtonWidget(
              label: 'Cadastrar',
              style: AppTextStyles.buttonPrimary,
              onPressed: () async {},
            ),
          ],
        ),
      ),
    );
  }
}

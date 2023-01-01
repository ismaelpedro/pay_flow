import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_flow/src/modules/core/core.dart';
import 'package:pay_flow/src/modules/core/infrastructure/service_locator/service_locator.dart';
import 'package:pay_flow/src/modules/ticket_form/presenter/ticket_form_controller.dart';

import 'widgets/bottom_button_widget.dart';
import 'widgets/tile_form_widget.dart';

class TicketFormPage extends StatefulWidget {
  final TicketEntity? ticket;
  const TicketFormPage({
    Key? key,
    this.ticket,
  }) : super(key: key);

  @override
  State<TicketFormPage> createState() => _TicketFormPageState();
}

class _TicketFormPageState extends State<TicketFormPage> {
  late TicketFormController _ticketFormStore;
  late MoneyMaskedTextController _moneyController;
  late TextEditingController _expirationEc;

  @override
  void initState() {
    _ticketFormStore = serviceLocator.get<TicketFormController>();
    _ticketFormStore.onInitTicketFormPage(widget.ticket!);
    _expirationEc = TextEditingController(text: _ticketFormStore.expirationDate);
    _moneyController = MoneyMaskedTextController(
      leftSymbol: 'R\$ ',
      initialValue: widget.ticket!.value!,
    );
    super.initState();
  }

  @override
  void dispose() {
    _moneyController.dispose();
    _expirationEc.dispose();
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
                        initialValue: _ticketFormStore.name,
                        imagePrefix: AppImages.ticket,
                        hintText: context.i18n.billName,
                        onChanged: _ticketFormStore.setName,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return context.i18n.requiredField;
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
                                  initialDateTime:
                                      DateTime.parse(widget.ticket!.date!),
                                  backgroundColor: Colors.white,
                                  mode: CupertinoDatePickerMode.date,
                                  onDateTimeChanged: (DateTime value) {
                                    _expirationEc.text =
                                        value.formatDateDDMMYYYY();
                                    _ticketFormStore.setExpirationDate(
                                      value.formatDateDDMMYYYY(),
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        },
                        child: IgnorePointer(
                          ignoring: true,
                          child: TileFormWidget(
                            controller: _expirationEc,
                            readOnly: true,
                            imagePrefix: AppImages.close,
                            hintText: context.i18n.expiration,
                            onChanged: _ticketFormStore.setExpirationDate,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return context.i18n.requiredField;
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      TileFormWidget(
                        imagePrefix: AppImages.wallet,
                        hintText: context.i18n.value,
                        controller: _moneyController,
                        onChanged: _ticketFormStore.setValue,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return context.i18n.requiredField;
                          }
                          if (_moneyController.numberValue < 5) {
                            return context.i18n.minValue5;
                          }
                          return null;
                        },
                      ),
                      TileFormWidget(
                        initialValue: _ticketFormStore.code,
                        imagePrefix: AppImages.barcode,
                        hintText: context.i18n.code,
                        onChanged: _ticketFormStore.setCode,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return context.i18n.requiredField;
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
            Expanded(
              child: BottomButtonWidget(
                label: context.i18n.cancel,
                style: AppTextStyles.buttonGray,
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Observer(
              builder: (_) {
                return Expanded(
                  child: Opacity(
                    opacity: _ticketFormStore.canSaveBill ? 1 : .3,
                    child: BottomButtonWidget(
                      label: context.i18n.register,
                      style: AppTextStyles.buttonPrimary,
                      onPressed: _ticketFormStore.canSaveBill
                          ? () async {
                              _ticketFormStore
                                  .saveBill(_moneyController.numberValue);
                            }
                          : null,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

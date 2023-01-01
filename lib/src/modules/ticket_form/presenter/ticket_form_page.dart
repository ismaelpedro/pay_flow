import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:pay_flow/src/modules/core/core.dart';
import 'package:pay_flow/src/modules/core/infrastructure/service_locator/service_locator.dart';
import 'package:pay_flow/src/modules/home/presenter/home_store.dart';
import 'package:uuid/uuid.dart';

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
  late HomeStore _homeStore;
  late AppStore _appStore;
  late MoneyMaskedTextController _moneyController;
  late TextEditingController _expirationEc;

  @override
  void initState() {
    _appStore = serviceLocator.get<AppStore>();
    _homeStore = serviceLocator.get<HomeStore>();
    _homeStore.onInitTicketFormPage(widget.ticket!);
    _expirationEc = TextEditingController(text: _homeStore.expirationDate);
    _moneyController = MoneyMaskedTextController(
      leftSymbol: 'R\$ ',
      initialValue: widget.ticket!.value,
    );
    super.initState();
  }

  @override
  void dispose() {
    _moneyController.dispose();
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
                        initialValue: _homeStore.name,
                        imagePrefix: AppImages.ticket,
                        hintText: context.i18n.billName,
                        onChanged: _homeStore.setName,
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
                                      DateTime.parse(widget.ticket!.date),
                                  backgroundColor: Colors.white,
                                  mode: CupertinoDatePickerMode.date,
                                  onDateTimeChanged: (DateTime value) {
                                    DateFormat dateFormat =
                                        DateFormat('dd/MM/yyyy');
                                    _expirationEc.text =
                                        dateFormat.format(value);
                                    _homeStore.setExpirationDate(
                                      dateFormat.format(value),
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
                            onChanged: _homeStore.setExpirationDate,
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
                        onChanged: _homeStore.setValue,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return context.i18n.requiredField;
                          }
                          if (_moneyController.numberValue < 5) {
                            return 'Valor mínimo do boleto é de R\$ 5,00';
                          }
                          return null;
                        },
                      ),
                      TileFormWidget(
                        initialValue: _homeStore.code,
                        imagePrefix: AppImages.barcode,
                        hintText: context.i18n.code,
                        onChanged: _homeStore.setCode,
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
                label: 'Cancelar',
                style: AppTextStyles.buttonGray,
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Observer(
              builder: (_) {
                return Expanded(
                  child: Opacity(
                    opacity: _homeStore.canSaveBill ? 1 : .3,
                    child: BottomButtonWidget(
                      label: 'Cadastrar',
                      style: AppTextStyles.buttonPrimary,
                      onPressed: _homeStore.canSaveBill
                          ? () async {
                              final TicketEntity newTicket = TicketEntity(
                                id: const Uuid().v4(),
                                name: _homeStore.name,
                                date: _homeStore.expirationDate,
                                code: _homeStore.code,
                                value: _moneyController.numberValue,
                              );
                              _appStore.setTickets(newTicket);
                              Navigator.pop(context);
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

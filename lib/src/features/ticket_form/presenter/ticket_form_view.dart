import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

import '../../../core/domain/entities/ticket_entity.dart';
import '../../../core/presenter/assets/assets.dart';
import '../../../core/presenter/extensions/extensions.dart';
import '../../../core/presenter/ui/theme/app_colors.dart';
import '../../../core/presenter/ui/theme/app_text_styles.dart';
import 'widgets/bottom_button_widget.dart';
import 'widgets/tile_form_widget.dart';

class TicketFormView extends StatefulWidget {
  final TicketEntity? ticket;
  const TicketFormView({
    super.key,
    this.ticket,
  });

  @override
  State<TicketFormView> createState() => _TicketFormViewState();
}

class _TicketFormViewState extends State<TicketFormView> {
  late MoneyMaskedTextController _moneyController;
  late TextEditingController _expirationEc;

  @override
  void initState() {
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
      onTap: () => context.unfocus(),
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
              const Center(
                child: Text(
                  'Preencha os dados\ndo boleto',
                  style: AppTextStyles.titleBoldHeading,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Form(
                  child: Column(
                    children: <Widget>[
                      TileFormWidget(
                        key: const ValueKey('nameFormField'),
                        imagePrefix: AppImages.ticket,
                        hintText: context.localizations.billName,
                        onChanged: (value) {},
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return context.localizations.requiredField;
                          }
                          return null;
                        },
                        thisintText: null,
                      ),
                      InkWell(
                        onTap: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (BuildContext builder) {
                              return SizedBox(
                                height: 255,
                                width: double.infinity,
                                child: CupertinoDatePicker(
                                  initialDateTime: DateTime.parse(widget.ticket!.date!),
                                  backgroundColor: Colors.white,
                                  mode: CupertinoDatePickerMode.date,
                                  onDateTimeChanged: (DateTime value) {
                                    _expirationEc.text = value.formatDateDDMMYYYY();
                                  },
                                ),
                              );
                            },
                          );
                        },
                        child: IgnorePointer(
                          ignoring: true,
                          child: TileFormWidget(
                            key: const ValueKey('expirationFormField'),
                            controller: _expirationEc,
                            readOnly: true,
                            imagePrefix: AppImages.close,
                            hintText: context.localizations.expiration,
                            onChanged: (value) {},
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return context.localizations.requiredField;
                              }
                              return null;
                            },
                            thisintText: null,
                          ),
                        ),
                      ),
                      TileFormWidget(
                        key: const ValueKey('valueFormField'),
                        imagePrefix: AppImages.wallet,
                        hintText: context.localizations.value,
                        controller: _moneyController,
                        onChanged: (value) {},
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return context.localizations.requiredField;
                          }
                          if (_moneyController.numberValue < 5) {
                            return context.localizations.minValue5;
                          }
                          return null;
                        },
                        thisintText: null,
                      ),
                      TileFormWidget(
                        key: const ValueKey('codeFormField'),
                        imagePrefix: AppImages.barcode,
                        hintText: context.localizations.code,
                        onChanged: (value) {},
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return context.localizations.requiredField;
                          }
                          return null;
                        },
                        thisintText: null,
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
                label: context.localizations.cancel,
                style: AppTextStyles.buttonGray,
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Expanded(
              child: Opacity(
                opacity: 1,
                child: BottomButtonWidget(
                  label: context.localizations.register,
                  style: AppTextStyles.buttonPrimary,
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

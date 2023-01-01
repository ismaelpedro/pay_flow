// ignore_for_file: unnecessary_null_comparison

import 'package:boleto_utils/boleto_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:pay_flow/src/modules/core/core.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  String name = '';

  @action
  void setName(String newName) => name = newName;

  @observable
  String expirationDate = '';

  @action
  void setExpirationDate(String newDate) => expirationDate = newDate;

  @observable
  String value = '';

  @action
  void setValue(String newValue) => value = newValue;

  @observable
  String code = '';

  @action
  void setCode(String newCode) => code = newCode;

  @computed
  bool get canSaveBill =>
      name.isNotEmpty &&
      value.isNotEmpty &&
      expirationDate.isNotEmpty &&
      code.isNotEmpty;

  @observable
  int currentIndex = 0;

  @action
  void setIndex(int newIndex) => currentIndex = newIndex;

  @observable
  bool isLoading = false;

  void onInitTicketFormPage(TicketEntity ticket) {
    String valueFormatted = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: 'R\$',
      decimalDigits: 2,
    ).format(ticket.value);

    String dateFormatted =
        DateFormat('dd/MM/yyyy').format(DateTime.parse(ticket.date));

    value = valueFormatted;
    expirationDate = dateFormatted.substring(0, 10);
    code = ticket.code;
  }

  Future<void> scanBarCode() async {
    try {
      BoletoUtils boletoUtils = BoletoUtils();

      String? result;
      result = await FlutterBarcodeScanner.scanBarcode(
        '#ffa500',
        navigatorKey.currentContext?.i18n.cancel,
        true,
        ScanMode.BARCODE,
      );

      if (result != '-1') {
        double value = boletoUtils.identificarValor(result);
        String date = boletoUtils
            .identificarData(
              codigo: result,
              tipoCodigo: TipoCodigo.codigoDeBarras,
            )
            .toUtc()
            .toString()
            .substring(0, 10);

        TicketEntity ticket = TicketEntity(
          date: date,
          code: result,
          value: value,
        );
        Navigator.pushNamed(
          navigatorKey.currentContext!,
          Routes.ticketForm,
          arguments: ticket,
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

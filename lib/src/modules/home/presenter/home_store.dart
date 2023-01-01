// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: unnecessary_null_comparison

import 'package:boleto_utils/boleto_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:mobx/mobx.dart';
import 'package:pay_flow/src/modules/core/core.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {


  @observable
  int currentIndex = 0;

  @action
  void setIndex(int newIndex) => currentIndex = newIndex;

  @observable
  bool isLoading = false;

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

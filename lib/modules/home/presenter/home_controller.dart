import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pay_flow/core/presenter/app_controller.dart';

import '../../../core/presenter/config/app_routes.dart';
import '../../../core/presenter/config/app_translations.dart';
import '../domain/usecases/delete_ticket_usecase/i_delete_ticket_usecase.dart';
import '../domain/usecases/get_tickets_usecase/i_get_tickets_usecase.dart';

class HomeController extends GetxController {
  final IGetTicketsUsecase _getTicketUsecase;
  final IDeleteTicketUsecase _deleteTicketUsecase;
  HomeController(this._getTicketUsecase, this._deleteTicketUsecase);

  getTickets() async {
    final tickets =
        await _getTicketUsecase(Get.find<AppController>().currentUser.id);
    tickets.fold(
      (l) => null,
      (ticketsList) => Get.find<AppController>().tickets.value = ticketsList,
    );
  }

  final _isLoading = true.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool newValue) => _isLoading.value = newValue;

  DateFormat getDateFormat() {
    final languageCode = Get.locale!.languageCode;

    final _dateFormatBrazil = DateFormat('dd/MM/yyyy');
    final _dateFormatSpain = DateFormat('dd-MM-yyyy');
    final _dateFormatEua = DateFormat('yyyy-MM-dd');

    if (languageCode == AppTranslationStrings.ptBr) {
      return _dateFormatBrazil;
    } else if (languageCode == AppTranslationStrings.esES) {
      return _dateFormatSpain;
    } else {
      return _dateFormatEua;
    }
  }

  NumberFormat getCurrencyFormat() {
    final languageCode = Get.locale!.languageCode;

    final _currencyDolar = NumberFormat.simpleCurrency();
    final _currencyBrazil = NumberFormat.simpleCurrency(
        locale: AppTranslationStrings.portugueseLanguage);
    final _currencySpain = NumberFormat.simpleCurrency(
        locale: AppTranslationStrings.spanishLanguage);

    if (languageCode == AppTranslationStrings.ptBr) {
      return _currencyBrazil;
    } else if (languageCode == AppTranslationStrings.enUS) {
      return _currencyDolar;
    } else {
      return _currencySpain;
    }
  }

  Future<void> scanBarCode() async {
    String barcodeScanResult = await FlutterBarcodeScanner.scanBarcode(
      '#FFFFFF',
      AppTranslationStrings.cancel.tr,
      true,
      ScanMode.BARCODE,
    );

    if (barcodeScanResult != '-1') {
      Get.toNamed(Routes.ticketForm, arguments: barcodeScanResult);
    }
  }

  @override
  void onInit() async {
    await Future.delayed(const Duration(seconds: 3));
    isLoading = false;
    super.onInit();
  }
}

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:pay_flow/core/presenter/app_controller.dart';

import '../../../core/presenter/config/app_routes.dart';
import '../../../core/presenter/config/app_translations.dart';
import '../domain/usecases/delete_ticket_usecase/i_delete_ticket_usecase.dart';
import '../domain/usecases/get_tickets_usecase/i_get_tickets_usecase.dart';

class HomeController extends GetxController {
  final IGetTicketsUsecase _getTicketUsecase;
  final IDeleteTicketUsecase _deleteTicketUsecase;

  HomeController(
    this._getTicketUsecase,
    this._deleteTicketUsecase,
  );

  final isLoading = false.obs;
  final currentIndex = 0.obs;

  getTickets() async {
    final tickets = await _getTicketUsecase(
      Get.find<AppController>().currentUser.id,
    );

    tickets.fold(
      (l) => l,
      (ticketsList) => Get.find<AppController>().tickets.value = ticketsList,
    );
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
}

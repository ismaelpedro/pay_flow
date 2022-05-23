import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

import '../../../core/presenter/config/app_routes.dart';
import '../../../core/presenter/config/app_translations.dart';

class HomeController extends GetxController {
  HomeController();

  final isLoading = false.obs;
  final currentIndex = 0.obs;
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

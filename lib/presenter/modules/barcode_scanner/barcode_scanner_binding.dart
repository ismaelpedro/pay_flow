import 'package:get/get.dart';
import './barcode_scanner_controller.dart';

class BarcodeScannerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BarcodeScannerController());
  }
}

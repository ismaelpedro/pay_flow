import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './barcode_scanner_controller.dart';

class BarcodeScannerPage extends GetView<BarcodeScannerController> {
  const BarcodeScannerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BarcodeScannerPage'),
      ),
      body: Container(),
    );
  }
}

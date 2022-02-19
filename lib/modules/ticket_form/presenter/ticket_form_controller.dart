import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';

class TicketFormController extends GetxController {
  final String? barCode = Get.arguments;

  final nameEC = TextEditingController();
  final expirationEC = MaskedTextController(mask: '00/00/0000');
  final valueEC = MoneyMaskedTextController(leftSymbol: 'R\$ ');
  final codeEC = TextEditingController();

  @override
  void onInit() {
    codeEC.text = barCode ?? '';
    valueEC.text = barCode?.substring(10) ?? '00';
    super.onInit();
  }

  @override
  void onClose() {
    nameEC.dispose();
    expirationEC.dispose();
    valueEC.dispose();
    codeEC.dispose();
    super.onClose();
  }
}

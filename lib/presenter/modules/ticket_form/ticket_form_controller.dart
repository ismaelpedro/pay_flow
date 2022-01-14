import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TicketFormController extends GetxController {
  final barCode = Get.arguments as String?;
  final nameEC = TextEditingController();
  final expirationEC = TextEditingController();
  final valueEC = TextEditingController();
  final codeEC = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    codeEC.text = barCode ?? '';
  }
}

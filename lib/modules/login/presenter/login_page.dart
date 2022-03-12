import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_flow/modules/login/presenter/widgets/login_body_widget.dart';

import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return controller.isLoading.value
            ? const Center(child: CupertinoActivityIndicator())
            : const LoginBodyWidget();
      }),
    );
  }
}

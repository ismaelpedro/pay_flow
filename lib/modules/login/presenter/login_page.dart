import 'package:flutter/material.dart';
import 'package:pay_flow/modules/login/presenter/widgets/login_body_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: LoginBodyWidget());
  }
}

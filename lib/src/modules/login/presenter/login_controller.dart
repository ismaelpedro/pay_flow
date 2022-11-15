// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';

import '../../core/core.dart';
import '../../core/infrastructure/service_locator/service_locator.dart';
import '../domain/usecases/login_with_google_usecase.dart';

class LoginController {
  final LoginWithGoogleUsecase _loginUsecase;
  LoginController(this._loginUsecase);

  Future<void> loginWithGoogle(BuildContext context) async {
    UserEntity? user = await _loginUsecase();

    if (user != null) {
      AppController appController = serviceLocator.get<AppController>();
      appController.currentUser = user;
      Navigator.pushNamed(
        context,
        Routes.home,
      );
    }
  }
}

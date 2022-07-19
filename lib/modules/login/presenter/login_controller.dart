// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

import '../../../core/presenter/navigation/routes.dart';
import '../../../core/presenter/presenter.dart';
import '../domain/usecases/login_with_google_usecase.dart';

class LoginController {
  final LoginWithGoogleUsecase _loginUsecase;
  LoginController(this._loginUsecase);

  Future<void> loginWithGoogle(BuildContext context) async {
    final user = await _loginUsecase();
    if (user != null) {
      GetIt.I<AppController>().currentUser = user;
      Navigator.pushNamed(
        context,
        Routes.home,
      );
    }
  }
}

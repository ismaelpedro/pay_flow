import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_flow/core/presenter/config/app_routes.dart';
import 'package:pay_flow/modules/login/domain/exceptions/login_exception.dart';
import 'package:pay_flow/modules/login/domain/usecases/get_user_usecase/i_get_user_usecase.dart';

import '../../../core/presenter/app_controller.dart';
import '../../../core/presenter/config/app_translations.dart';
import '../domain/usecases/login_with_google_usecase/i_login_with_google_usecase.dart';
import '../domain/usecases/save_user_usecase/i_save_user_usecase.dart';

class LoginController extends GetxController {
  final ILoginWithGoogleUsecase _loginWithGoogleUsecase;
  final ISaveUserUsecase _saveUserUsecase;
  final IGetUserUsecase _getUserUsecase;

  LoginController(
    this._loginWithGoogleUsecase,
    this._saveUserUsecase,
    this._getUserUsecase,
  );

  var isLoading = false.obs;
  var dropdownvalue = AppTranslationStrings.ptBr.tr.obs;

  Future<void> login() async {
    final appController = Get.find<AppController>();

    try {
      final userGoogle = await _loginWithGoogleUsecase();
      isLoading.value = true;

      if (userGoogle != null) {
        final serviceUser = await _getUserUsecase(userGoogle.id);

        if (serviceUser == null) {
          final saveUser = await _saveUserUsecase(userGoogle);
          appController.currentUser = saveUser!;
        } else {
          appController.currentUser = serviceUser;
        }
        Get.offAllNamed(Routes.home);
      }
      isLoading.value = false;
    } on LoginException {
      Get.snackbar(
        'Erro!',
        'Ocorreu um erro ao tentar logar',
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    }
  }
}

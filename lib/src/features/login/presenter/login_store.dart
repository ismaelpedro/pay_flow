import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/core.dart';
import '../../../core/utils/utils.dart';
import '../domain/usecases/login_with_google_usecase.dart';

part 'login_store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  final LoginWithGoogleUsecase _loginUsecase;
  final AppStore _appStore;
  final Utils _utils;

  LoginStoreBase(
    this._loginUsecase,
    this._appStore,
    this._utils,
  );

  Future<void> loginWithGoogle() async {
    UserEntity? loginUser = await _loginUsecase();

    if (loginUser != null) {
      _appStore.user = loginUser;
      await _utils.getVersionApp();
      Navigator.pushReplacementNamed(
        navigatorKey.currentState!.context,
        Routes.home,
      );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../core/core.dart';
import '../domain/usecases/login_with_google_usecase.dart';

part 'login_store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  final LoginWithGoogleUsecase _loginUsecase;
  final AppStore _appStore;

  LoginStoreBase(
    this._loginUsecase,
    this._appStore,
  );

  Future<void> loginWithGoogle(
    BuildContext context, [
    bool mounted = true,
  ]) async {
    UserEntity? user = await _loginUsecase();

    if (user != null) {
      _appStore.currentUser = user;
      if (!mounted) return;
      Navigator.pushNamed(
        context,
        Routes.home,
      );
    }
  }
}

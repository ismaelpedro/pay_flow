import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../../core/infrastructure/auth/auth_service.dart';
import '../../../../core/utils/admob_id.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthService _authService;
  LoginCubit(this._authService) : super(LoginInitial());

  String appVersion = 'v1.0.0';
  final isLoginButtonEnabled = ValueNotifier<bool>(false);
  final ocultPassword = ValueNotifier<bool>(true);
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  final BannerAd bottomAds = BannerAd(
    size: AdSize.leaderboard,
    adUnitId: AdmobId.loginBottom,
    listener: const BannerAdListener(),
    request: const AdRequest(),
  );

  void validateForm() {
    isLoginButtonEnabled.value = RegExp(
          r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
        ).hasMatch(emailEC.text) &&
        passwordEC.text.isNotEmpty;
  }

  void changeOcultPassword() => ocultPassword.value = !ocultPassword.value;

  Future<UserCredential?> loginWithGoogle() async {
    return await _authService.signInWithGoogle();
  }

  Future<UserCredential?> loginWithApple() async {
    return await _authService.signInWithApple();
  }
}

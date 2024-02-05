// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../../../pay_flow_app.dart';
import '../../../../core/infrastructure/auth/auth_service.dart';
import '../../../../core/presenter/extensions/extensions.dart';
import '../../../../core/presenter/navigation/routes.dart';
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

  void _toHomeView() => Navigator.pushNamed(
        navigatorKey.currentContext!,
        Routes.home,
      );

  Future<void> loginWithGoogle() async {
    await _authService.signInWithGoogle().onLoading();
    _toHomeView();
  }

  Future<void> loginWithApple() async {
    await _authService.signInWithApple().onLoading();
    _toHomeView();
  }
}

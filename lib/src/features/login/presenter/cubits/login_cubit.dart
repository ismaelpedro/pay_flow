import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../../core/utils/admob_id.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final ocultPassword = ValueNotifier<bool>(true);
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  final BannerAd bottomAds = BannerAd(
    size: AdSize.banner,
    adUnitId: AdmobId.loginBottom,
    listener: const BannerAdListener(),
    request: const AdRequest(),
  );

  void changeOcultPassword() {
    ocultPassword.value = !ocultPassword.value;
  }
}

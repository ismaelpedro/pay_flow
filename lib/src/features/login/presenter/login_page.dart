import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:pay_flow/src/core/presenter/ui/widgets/translation_dropdown_widget.dart';

import '../../../core/core.dart';
import '../../../core/infrastructure/service_locator/service_locator.dart';
import '../../../core/utils/admob_id.dart';
import 'login_store.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginStore _store;

  final BannerAd bottomAds = BannerAd(
    size: AdSize.banner,
    adUnitId: AdmobId.loginBottom,
    listener: const BannerAdListener(),
    request: const AdRequest(),
  );

  @override
  void initState() {
    _store = serviceLocator.get<LoginStore>();
    bottomAds.load();
    super.initState();
  }

  @override
  void dispose() {
    bottomAds.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          extendBody: true,
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      height: 220.h,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: AppColors.orange,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(64),
                          bottomRight: Radius.circular(64),
                        ),
                      ),
                      child: Container(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: Text(
                            context.i18n.loginTitleCenter,
                            style: AppTextStyles.trailingBold.copyWith(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 90.h),
                          const TextField(
                            decoration: InputDecoration(labelText: 'Insira seu login'),
                          ),
                          SizedBox(height: 10.h),
                          const TextField(
                            obscureText: true,
                            obscuringCharacter: '*',
                            decoration: InputDecoration(labelText: 'Sua senha'),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: TextButton(
                              child: const Text('Esqueceu a senha?'),
                              onPressed: () {},
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.orange,
                              ),
                              child: Text(
                                'Entrar',
                                style: AppTextStyles.buttonBoldBackground,
                              ),
                              onPressed: () {},
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            children: <Widget>[
                              const Flexible(child: Divider(thickness: 1)),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  'ou entre com',
                                  style: AppTextStyles.trailingRegular,
                                ),
                              ),
                              const Flexible(child: Divider(thickness: 1)),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              InkWell(
                                onTap: () {},
                                child: Ink(
                                  child: Container(
                                    height: 56,
                                    width: 56,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(color: AppColors.orange),
                                    ),
                                    child: Image.asset(AppImages.facebook),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              InkWell(
                                onTap: () => _store.loginWithGoogle(),
                                child: Ink(
                                  child: Container(
                                    height: 56,
                                    width: 56,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(color: AppColors.orange),
                                    ),
                                    child: Image.asset(AppImages.google),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              InkWell(
                                onTap: () {},
                                child: Ink(
                                  child: Container(
                                    height: 56,
                                    width: 56,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(color: AppColors.orange),
                                    ),
                                    child: Image.asset(AppImages.apple),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 100.h),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 50.h,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 100.h),
                    child: Image.asset(AppImages.person, height: 220.h),
                  ),
                ),
                Positioned(
                  right: 10.h,
                  top: 250.h,
                  child: const TranslationDropdownWidget(),
                ),
              ],
            ),
          ),
          bottomNavigationBar: SizedBox(
            height: 60.h,
            width: bottomAds.size.width.toDouble(),
            child: AdWidget(ad: bottomAds),
          ),
        ),
      ),
    );
  }
}

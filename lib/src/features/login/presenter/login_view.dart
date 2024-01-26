import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../core/presenter/assets/assets.dart';
import '../../../core/presenter/extensions/extensions.dart';
import '../../../core/presenter/ui/ui.dart';
import '../../../core/utils/admob_id.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final BannerAd bottomAds = BannerAd(
    size: AdSize.banner,
    adUnitId: AdmobId.loginBottom,
    listener: const BannerAdListener(),
    request: const AdRequest(),
  );

  @override
  void initState() {
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
    return GestureDetector(
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
                    height: 250,
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
                        padding: const EdgeInsets.only(top: 55),
                        child: Text(
                          context.localizations.loginTitleCenter,
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
                        const SizedBox(height: 90),
                        const TextField(
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.email_outlined),
                            labelText: 'Insira seu login',
                          ),
                        ),
                        const SizedBox(height: 10),
                        const TextField(
                          obscureText: true,
                          obscuringCharacter: '*',
                          decoration: InputDecoration(
                            labelText: 'Sua senha',
                            suffixIcon: Icon(Icons.remove_red_eye_outlined),
                          ),
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
                            child: const Text(
                              'Entrar',
                              style: AppTextStyles.buttonBoldBackground,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Row(
                          children: <Widget>[
                            Flexible(child: Divider(thickness: 1)),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                'ou entre com',
                                style: AppTextStyles.trailingRegular,
                              ),
                            ),
                            Flexible(child: Divider(thickness: 1)),
                          ],
                        ),
                        const SizedBox(height: 20),
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
                              onTap: () {},
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
                        const SizedBox(height: 100),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 85,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 100),
                  child: Image.asset(AppImages.person, height: 220),
                ),
              ),
              const Positioned(
                right: 10,
                top: 280,
                child: TranslationDropdownWidget(),
              ),
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 60,
          width: bottomAds.size.width.toDouble(),
          child: AdWidget(ad: bottomAds),
        ),
      ),
    );
  }
}

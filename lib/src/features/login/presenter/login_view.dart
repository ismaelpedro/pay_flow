import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../core/infrastructure/service_locator/service_locator.dart';
import '../../../core/presenter/assets/assets.dart';
import '../../../core/presenter/extensions/extensions.dart';
import '../../../core/presenter/ui/theme/app_colors.dart';
import '../../../core/presenter/ui/theme/app_text_styles.dart';
import '../../../core/presenter/ui/widgets/translation_dropdown_widget.dart';
import 'cubits/login_cubit.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late LoginCubit _cubit;

  @override
  void initState() {
    _cubit = locator.get<LoginCubit>();
    _cubit.bottomAds.load();
    _initPackageInfo();
    super.initState();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _cubit.appVersion = info.version;
    });
  }

  @override
  void dispose() {
    _cubit.bottomAds.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: 220,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.orange,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(85),
                    bottomRight: Radius.circular(85),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(5, 5),
                    ),
                  ],
                ),
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        context.localizations.loginTitleCenter,
                        style: AppTextStyles.trailingBold.copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Image.asset(
                        AppImages.logoFull,
                        height: 90,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: _cubit.validateForm,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 16),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: TranslationDropdownWidget(),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _cubit.emailEC,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.email_outlined),
                          labelText: context.localizations.emailInput,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ValueListenableBuilder(
                        valueListenable: _cubit.ocultPassword,
                        builder: (_, value, ___) => TextFormField(
                          controller: _cubit.passwordEC,
                          obscureText: value,
                          obscuringCharacter: '*',
                          decoration: InputDecoration(
                            labelText: context.localizations.passwordInput,
                            suffixIcon: IconButton(
                              onPressed: _cubit.changeOcultPassword,
                              icon: Icon(
                                !value ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          child: Text(context.localizations.forgotPassword),
                          onPressed: () {},
                        ),
                      ),
                      ValueListenableBuilder<bool>(
                        valueListenable: _cubit.isLoginButtonEnabled,
                        builder: (context, isButtonEnabled, _) {
                          return SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.orange,
                              ),
                              onPressed: isButtonEnabled ? () {} : null,
                              child: Text(
                                context.localizations.loginButton,
                                style: AppTextStyles.trailingBold.copyWith(color: Colors.white),
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: <Widget>[
                          const Flexible(child: Divider(thickness: 1)),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              context.localizations.orSignInWith,
                              style: AppTextStyles.trailingRegular,
                            ),
                          ),
                          const Flexible(child: Divider(thickness: 1)),
                        ],
                      ),
                      const SizedBox(height: 16),
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
                          Opacity(
                            opacity: Platform.isAndroid ? 0.3 : 1,
                            child: InkWell(
                              onTap: Platform.isAndroid ? null : () {},
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
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        _cubit.appVersion,
                        style: AppTextStyles.trailingRegular,
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 50,
          width: double.infinity,
          child: Platform.isIOS ? const Placeholder() : AdWidget(ad: _cubit.bottomAds),
        ),
      ),
    );
  }
}

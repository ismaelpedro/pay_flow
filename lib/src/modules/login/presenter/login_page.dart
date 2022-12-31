import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/core.dart';
import '../../core/infrastructure/service_locator/service_locator.dart';
import 'login_store.dart';
import 'widgets/translation_dropdown_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginStore _store;

  @override
  void initState() {
    _store = serviceLocator.get<LoginStore>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: 316.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.orange,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(60.h),
                      bottomRight: Radius.circular(60.h),
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10.h, right: 10.w),
                      child: const TranslationDropdownWidget(),
                    ),
                  ),
                ),
                SizedBox(height: 130.h),
                Image.asset(AppImages.logomini),
                SizedBox(height: 24.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 70.w),
                  child: Text(
                    context.i18n.loginTitleCenter,
                    style: AppTextStyles.titleHome,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 40.h),
                SizedBox(
                  width: 295.w,
                  height: 56.h,
                  child: ElevatedButton.icon(
                    icon: Image.asset(AppImages.google),
                    label: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 45.w),
                      child: Text(
                        context.i18n.loginButtonText,
                        style: AppTextStyles.buttonGray,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 3,
                      backgroundColor: AppColors.secondary,
                    ),
                    onPressed: () async {
                      await _store.loginWithGoogle();
                    },
                  ),
                ),
                SizedBox(height: 40.h),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 300.h),
              child: Image.asset(
                AppImages.person,
                height: 300.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

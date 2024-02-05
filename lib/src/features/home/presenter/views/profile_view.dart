// ignore_for_file: always_specify_types

import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../../core/infrastructure/auth/auth_service.dart';
import '../../../../core/infrastructure/service_locator/service_locator.dart';
import '../../../../core/presenter/assets/assets.dart';
import '../../../../core/presenter/extensions/extensions.dart';
import '../../../../core/presenter/ui/theme/app_text_styles.dart';
import '../../../../core/presenter/ui/widgets/translation_dropdown_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String appVersion = '1.0.0';
  late AuthService authService;

  @override
  void initState() {
    authService = locator.get<AuthService>();
    _initPackageInfo();
    super.initState();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() => appVersion = info.version);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                height: 220,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: context.theme.primaryColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(85),
                    bottomRight: Radius.circular(85),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
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
              const SizedBox(height: 24),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(
                      Icons.language,
                      color: context.theme.primaryColor,
                    ),
                    const SizedBox(width: 30),
                    Text(
                      context.localizations.language,
                      style: AppTextStyles.buttonHeading,
                    ),
                  ],
                ),
                trailing: const SizedBox(
                  height: 100,
                  child: TranslationDropdownWidget(),
                ),
              ),
              const Divider(),
              SwitchListTile.adaptive(
                title: Row(
                  children: <Widget>[
                    Icon(
                      Icons.notifications_outlined,
                      color: context.theme.primaryColor,
                    ),
                    const SizedBox(width: 30),
                    Text(
                      context.localizations.notifications,
                      style: AppTextStyles.buttonHeading,
                    ),
                  ],
                ),
                value: true,
                onChanged: (bool value) {},
              ),
              const Divider(),
              SwitchListTile.adaptive(
                title: Row(
                  children: <Widget>[
                    Icon(
                      Icons.light_mode_outlined,
                      color: context.theme.primaryColor,
                    ),
                    const SizedBox(width: 30),
                    Text(
                      context.localizations.darkTheme,
                      style: AppTextStyles.buttonHeading,
                    ),
                  ],
                ),
                value: false,
                onChanged: (bool value) {},
              ),
              const Divider(),
              ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.handyman_outlined,
                  color: context.theme.primaryColor,
                ),
                title: Text(
                  context.localizations.aboutDev,
                  style: AppTextStyles.buttonHeading,
                ),
                trailing: const Icon(
                  Icons.navigate_next_sharp,
                  color: Colors.black,
                ),
              ),
              const Divider(),
              const SizedBox(height: 20),
              Container(
                height: 60,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: OutlinedButton.icon(
                  icon: Icon(
                    Icons.attach_money_rounded,
                    color: context.theme.primaryColor,
                  ),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(
                        color: context.theme.primaryColor,
                      ),
                    ),
                  ),
                  onPressed: () {},
                  label: Text(
                    context.localizations.donate,
                    style: AppTextStyles.captionBoldBody.copyWith(
                      color: context.theme.primaryColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                alignment: Alignment.bottomLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        'v$appVersion',
                        style: AppTextStyles.captionBoldBody,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextButton.icon(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.only(left: 16),
                      ),
                      icon: Icon(
                        Icons.exit_to_app,
                        color: context.theme.primaryColor,
                      ),
                      label: Text(
                        context.localizations.logout,
                        style: AppTextStyles.captionBoldBody.copyWith(
                          color: context.theme.primaryColor,
                        ),
                      ),
                      onPressed: () {
                        authService.signOut().onLoading();
                      },
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

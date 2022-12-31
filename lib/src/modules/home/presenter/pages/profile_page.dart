import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';
import '../../../core/infrastructure/service_locator/service_locator.dart';
import '../../../login/presenter/widgets/translation_dropdown_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late AppStore _appStore;

  @override
  void initState() {
    _appStore = serviceLocator.get<AppStore>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Perfil',
          style: AppTextStyles.titleBoldHeading,
        ),
        centerTitle: true,
        actions: const <Widget>[
          TranslationDropdownWidget(),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.h),
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  _appStore.user!.imageUrl,
                  // width: 100,
                  // height: 100,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                _appStore.user!.name,
                style: AppTextStyles.titleBoldHeading,
              ),
              const SizedBox(height: 10),
              Text(
                _appStore.user!.email,
                style: AppTextStyles.titleBoldHeading,
              ),
              SizedBox(height: 20.h),
              const Divider(thickness: 2),
              SizedBox(height: 20.h),
              Text(
                'Considere fazer uma doação :)',
                style: AppTextStyles.titleRegular.copyWith(
                  color: AppColors.heading,
                ),
              ),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(width: 20.w),
                  GestureDetector(
                    onTap: () async {
                      await Clipboard.setData(
                        const ClipboardData(
                          text: '4483c72c-1b90-4b4f-b4b1-aac30aa078ed',
                        ),
                      );
                    },
                    child: Image.asset(
                      AppImages.pix,
                      width: 100,
                      height: 100,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}

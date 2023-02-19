// ignore_for_file: always_specify_types

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';
import '../../../core/infrastructure/service_locator/service_locator.dart';
import '../../../core/utils/utils.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // ignore: unused_field
  late AppStore _appStore;
  late Utils _utils;

  @override
  void initState() {
    _appStore = serviceLocator.get<AppStore>();
    _utils = serviceLocator.get<Utils>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                color: AppColors.orange,
                height: 184.h,
              ),
              SizedBox(height: 10.h),
              ListTile(
                title: Row(
                  children: <Widget>[
                    const Icon(
                      Icons.language,
                      color: AppColors.orange,
                    ),
                    const SizedBox(width: 30),
                    Text(
                      'Idioma',
                      style: AppTextStyles.buttonHeading,
                    ),
                  ],
                ),
                // trailing: SizedBox(
                //   height: 100,
                //   child: DropdownButton<dynamic>(
                //     items: const <DropdownMenuItem>[
                //       DropdownMenuItem<String>(
                //         child: Text('Portugues'),
                //       ),
                //       DropdownMenuItem<String>(
                //         child: Text('Ingles'),
                //       ),
                //     ],
                //     onChanged: (Object? value) {},
                //   ),
                // ),
              ),
              SwitchListTile.adaptive(
                title: Row(
                  children: <Widget>[
                    const Icon(
                      Icons.notifications_outlined,
                      color: AppColors.orange,
                    ),
                    const SizedBox(width: 30),
                    Text(
                      'Notificaçōes',
                      style: AppTextStyles.buttonHeading,
                    ),
                  ],
                ),
                value: true,
                onChanged: (bool value) {},
              ),
              SwitchListTile.adaptive(
                title: Row(
                  children: <Widget>[
                    const Icon(
                      Icons.light_mode_outlined,
                      color: AppColors.orange,
                    ),
                    const SizedBox(width: 30),
                    Text(
                      'Mode Light',
                      style: AppTextStyles.buttonHeading,
                    ),
                  ],
                ),
                value: true,
                onChanged: (bool value) {},
              ),
              SizedBox(height: 50.h),
              Container(
                height: 80.h,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: OutlinedButton.icon(
                  icon: const Icon(
                    Icons.attach_money_rounded,
                    color: AppColors.orange,
                  ),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: const BorderSide(color: AppColors.orange),
                    ),
                  ),
                  onPressed: () {},
                  label: Text(
                    'Doar',
                    style: AppTextStyles.captionBoldBody
                        .copyWith(color: AppColors.orange),
                  ),
                ),
              ),
              SizedBox(height: 50.h),
              Container(
                alignment: Alignment.bottomLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        'Versāo ${_utils.version}',
                        style: AppTextStyles.captionBoldBody,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextButton.icon(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.only(left: 16),
                      ),
                      icon: const Icon(
                        Icons.exit_to_app,
                        color: AppColors.orange,
                      ),
                      label: Text(
                        'Sair',
                        style: AppTextStyles.captionBoldBody
                            .copyWith(color: AppColors.orange),
                      ),
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          Routes.login,
                          (Object route) => false,
                        );
                      },
                    ),
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

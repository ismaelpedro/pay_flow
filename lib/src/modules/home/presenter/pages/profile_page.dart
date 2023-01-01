import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';
import '../../../core/infrastructure/service_locator/service_locator.dart';
import '../../../core/utils.dart';
import '../../../login/presenter/widgets/translation_dropdown_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          context.i18n.perfil,
          style: AppTextStyles.titleBoldHeading,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.h),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.grey[200],
                    child: Image.network(
                      _appStore.user!.imageUrl,
                      loadingBuilder:
                          (_, Widget child, ImageChunkEvent? progress) {
                        if (progress == null) {
                          return child;
                        }
                        return const Center(
                          child: CupertinoActivityIndicator(),
                        );
                      },
                      height: 60.h,
                      width: 60.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                IgnorePointer(
                  ignoring: true,
                  child: TextFormField(
                    readOnly: true,
                    initialValue: _appStore.user!.name,
                    decoration: const InputDecoration(
                      labelText: 'Nome completo',
                      enabledBorder: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                IgnorePointer(
                  ignoring: true,
                  child: TextFormField(
                    readOnly: true,
                    initialValue: _appStore.user!.email,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      enabledBorder: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity,
                  ),
                  leading: const Icon(
                    Icons.exit_to_app_outlined,
                    color: Colors.black,
                  ),
                  title: const Text(
                    'Log out',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                    // style: AppTextStyles.titleListTile,
                  ),
                  onTap: () => _appStore.logOut(),
                ),
                const SizedBox(height: 20),
                Opacity(
                  opacity: .3,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Pay Flow - Developed by Ismael Pedro™ ©',
                          style: AppTextStyles.captionBody,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'v${_utils.version}',
                          style: AppTextStyles.captionBoldBody,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        elevation: 0,
        child: const TranslationDropdownWidget(),
        onPressed: () {},
      ),
    );
  }
}

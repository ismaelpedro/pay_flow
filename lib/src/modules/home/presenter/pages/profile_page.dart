import 'package:flutter/material.dart';
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
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    _appStore.user!.imageUrl,
                    width: 200,
                    height: 200,
                  ),
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
            ],
          ),
        ),
      ),
    );
  }
}

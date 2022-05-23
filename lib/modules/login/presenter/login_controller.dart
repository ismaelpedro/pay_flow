import 'package:get/get.dart';
import 'package:pay_flow/core/presenter/app_controller.dart';
import 'package:pay_flow/core/presenter/config/app_routes.dart';
import 'package:pay_flow/modules/login/domain/usecases/get_user_usecase/i_get_user_usecase.dart';

import '../../../core/presenter/config/app_translations.dart';
import '../domain/usecases/login_with_google_usecase/i_login_with_google_usecase.dart';
import '../domain/usecases/save_user_usecase/i_save_user_usecase.dart';

class LoginController extends GetxController {
  final ILoginWithGoogleUsecase _loginWithGoogleUsecase;
  final ISaveUserUsecase _saveUserUsecase;
  final IGetUserUsecase _getUserUsecase;

  LoginController(
    this._loginWithGoogleUsecase,
    this._saveUserUsecase,
    this._getUserUsecase,
  );

  var isLoading = false.obs;
  var dropdownvalue = AppTranslationStrings.ptBr.tr.obs;

  Future<void> login() async {
    final user = await _loginWithGoogleUsecase();
    Get.find<AppController>().currentUser = user!;
    Get.offAllNamed(Routes.home);
  }
}

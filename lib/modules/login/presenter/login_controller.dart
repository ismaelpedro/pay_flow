import 'package:get/get.dart';

import '../../../core/presenter/app_controller.dart';
import '../../../core/presenter/config/app_routes.dart';
import '../../../core/presenter/config/app_translations.dart';
import '../domain/usecases/login_with_google_usecase/i_login_with_google_usecase.dart';

class LoginController extends GetxController {
  final ILoginWithGoogleUsecase _loginWithGoogleUsecase;
  LoginController(this._loginWithGoogleUsecase);

  var isLoading = false.obs;
  var dropdownvalue = AppTranslationStrings.ptBr.tr.obs;

  Future<void> login() async {
    final usecase = await _loginWithGoogleUsecase();

    return await usecase.fold(
      (exception) => exception,
      (userRight) {
        Get.find<AppController>().currentUser = userRight;
        Get.toNamed(Routes.home);
      },
    );
  }
}

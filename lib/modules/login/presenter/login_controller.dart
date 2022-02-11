import 'package:get/get.dart';

import '../../../core/domain/usecases/login_with_google_usecase/i_login_with_google_usecase.dart';
import '../../../core/domain/usecases/save_user_usecase/i_save_user_usecase.dart';
import '../../../core/presenter/app_controller.dart';
import '../../../core/presenter/config/app_routes.dart';
import '../../../core/presenter/config/app_translations.dart';

class LoginController extends GetxController {
  final ILoginWithGoogleUsecase loginWithGoogleUsecase;
  final ISaveUserUsecase saveUserUsecase;

  LoginController(
    this.loginWithGoogleUsecase,
    this.saveUserUsecase,
  );

  var dropdownvalue = AppTranslationStrings.ptBr.tr.obs;
  var isLoading = false.obs;

  Future<void> login() async {
    final usecase = await loginWithGoogleUsecase();

    return await usecase.fold(
      (exception) => exception,
      (userRight) async {
        Get.find<AppController>().currentUser = userRight;
        Get.toNamed(Routes.home);
      },
    );
  }
}

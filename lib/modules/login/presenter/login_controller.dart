import 'package:get/get.dart';
import 'package:pay_flow/core/domain/usecases/save_user_usecase/i_save_user_usecase.dart';
import 'package:pay_flow/modules/login/domain/usecases/get_user_usecase/i_get_user_usecase.dart';

import '../../../core/presenter/app_controller.dart';
import '../../../core/presenter/config/app_routes.dart';
import '../../../core/presenter/config/app_translations.dart';
import '../domain/usecases/login_with_google_usecase/i_login_with_google_usecase.dart';

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
    final loginUsecase = await _loginWithGoogleUsecase();
    final appController = Get.find<AppController>();

    loginUsecase.fold(
      (exception) => exception,
      (userGoogleLogin) async {
        final responseGetUser = await _getUserUsecase(userGoogleLogin.id);

        responseGetUser.fold(
          (l) => l,
          (userPicked) async {
            if (userPicked == null) {
              final responseSaveUser = await _saveUserUsecase(userGoogleLogin);

              responseSaveUser.fold(
                (exception) => exception,
                (userRight) {
                  appController.currentUser = userRight;
                },
              );
            }
            appController.currentUser = userPicked!;
          },
        );
        Get.toNamed(Routes.home);
      },
    );
  }
}

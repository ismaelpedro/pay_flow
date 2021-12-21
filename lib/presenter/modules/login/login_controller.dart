import 'package:get/get.dart';
import 'package:pay_flow/domain/usecases/save_user_usecase/i_save_user_usecase.dart';

import '../../../../domain/usecases/login_with_google_usecase/i_login_with_google_usecase.dart';
import '../../config/app_translations.dart';

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
    try {
      final user = await loginWithGoogleUsecase();
      if (user != null) {
        await user.fold(
          (l) => null,
          (r) async => await saveUserUsecase(r),
        );
      }
    } catch (e) {
      Exception('$e');
    }
  }
}

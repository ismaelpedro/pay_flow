import 'package:get/get.dart';
import 'package:pay_flow/domain/usecases/save_user_in_hasura_usecase/i_save_user_in_hasura_usecase.dart';

import '../../../../domain/usecases/login_with_google_usecase/i_login_with_google_usecase.dart';
import '../../../config/app_translations.dart';

class LoginController extends GetxController {
  final ILoginWithGoogleUsecase loginWithGoogleUsecase;
  final ISaveUserInHasuraUsecase saveUserInHasuraUsecase;

  var dropdownvalue = AppTranslationStrings.ptBr.tr.obs;

  LoginController(this.loginWithGoogleUsecase, this.saveUserInHasuraUsecase);

  Future<void> login() async {
    try {
      final user = await loginWithGoogleUsecase();
      if (user != null) {
        await user.fold(
          (l) => null,
          (r) async => await saveUserInHasuraUsecase(r),
        );
      }
    } catch (e) {
      Exception('$e');
    }
  }
}

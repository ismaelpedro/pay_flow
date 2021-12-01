import 'package:get/get.dart';

import '../../../../domain/usecases/login_with_google_usecase/i_login_with_google_usecase.dart';
import '../../../config/app_translations.dart';

class LoginController extends GetxController {
  final ILoginWithGoogleUsecase loginWithGoogleUsecase;
  var dropdownvalue = AppTranslationStrings.ptBr.tr.obs;

  LoginController(this.loginWithGoogleUsecase);
}

import 'package:get/get.dart';

import '../domain/usecases/login_with_google_usecase/i_login_with_google_usecase.dart';

class LoginController extends GetxController {
  final ILoginWithGoogleUsecase loginWithGoogleUsecase;

  LoginController(this.loginWithGoogleUsecase);
}

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pay_flow/modules/login/external/drivers/google_sign_in_driver.dart';

import '../domain/usecases/login_with_google_usecase/login_with_google_usecase.dart';
import 'login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(GoogleSignIn());
    Get.put(GoogleSignInDriver(Get.find<GoogleSignIn>()));
    Get.put(LoginWithGoogleUsecase(Get.find<GoogleSignInDriver>()));
    Get.put(LoginController(Get.find<LoginWithGoogleUsecase>()));
  }
}

import 'package:get/get.dart';
 import '../domain/usecases/login_with_google_usecase/login_with_google_usecase.dart';
import 'login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginWithGoogleUsecase());
    Get.lazyPut(() => LoginController(Get.find<LoginWithGoogleUsecase>()));
  }
}

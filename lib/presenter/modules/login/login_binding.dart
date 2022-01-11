import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pay_flow/infra/repositories/user_repository.dart';
import 'package:pay_flow/infra/services/hasura_service.dart';

import '../../../../domain/usecases/login_with_google_usecase/login_with_google_usecase.dart';
import '../../../domain/usecases/save_user_usecase/save_user_usecase.dart';
import 'login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginWithGoogleUsecase(Get.find<GoogleSignIn>()));
    Get.lazyPut(() => SaveUserUsecase(Get.find<UserRepository>()));
    Get.lazyPut(() => LoginController(
          Get.find<LoginWithGoogleUsecase>(),
          Get.find<SaveUserUsecase>(),
        ));
    Get.lazyPut(() => GoogleSignIn());
    Get.lazyPut(() => UserRepository(Get.find<HasuraService>()));
  }
}

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/domain/usecases/login_with_google_usecase/login_with_google_usecase.dart';
import '../../../core/domain/usecases/save_user_usecase/save_user_usecase.dart';
import '../../../core/infra/repositories/user_repository.dart';
import '../../../core/infra/services/google_sign_in_service.dart';
import '../../../core/infra/services/hasura_service.dart';
import 'login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GoogleSignIn());
    Get.lazyPut(() => GoogleSignInService(Get.find<GoogleSignIn>()));
    Get.lazyPut(() => LoginWithGoogleUsecase(Get.find<GoogleSignInService>()));
    Get.lazyPut(() => SaveUserUsecase(Get.find<UserRepository>()));
    Get.lazyPut(() => LoginController(
          Get.find<LoginWithGoogleUsecase>(),
          Get.find<SaveUserUsecase>(),
        ));
    Get.lazyPut(() => UserRepository(Get.find<HasuraService>()));
  }
}

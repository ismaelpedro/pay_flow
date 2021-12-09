import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../domain/usecases/login_with_google_usecase/login_with_google_usecase.dart';
import '../../../domain/usecases/save_user_usecase/save_user_in_hasura_usecase.dart';
import '../../../infra/repositories/services/hasura/hasura_service.dart';
import '../../../infra/repositories/user_repositories/save_user_repository.dart';
import 'login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GoogleSignIn());
    Get.lazyPut(() => LoginWithGoogleUsecase(Get.find<GoogleSignIn>()));
    Get.lazyPut(() => SaveUserRepository(Get.find<HasuraService>()));
    Get.lazyPut(() => SaveUserUsecase(Get.find<SaveUserRepository>()));
    Get.lazyPut(() => LoginController(
          Get.find<LoginWithGoogleUsecase>(),
          Get.find<SaveUserUsecase>(),
        ));
  }
}

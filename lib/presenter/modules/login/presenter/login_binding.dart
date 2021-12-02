import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hasura_connect/hasura_connect.dart';

import '../../../../domain/usecases/login_with_google_usecase/login_with_google_usecase.dart';
import '../../../../domain/usecases/save_user_in_hasura_usecase/save_user_in_hasura_usecase.dart';
import 'login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GoogleSignIn());
    Get.lazyPut(() => LoginWithGoogleUsecase(Get.find<GoogleSignIn>()));
    Get.lazyPut(() => SaveUserInHasuraUsecase(Get.find<HasuraConnect>()));
    Get.lazyPut(() => LoginController(
          Get.find<LoginWithGoogleUsecase>(),
          Get.find<SaveUserInHasuraUsecase>(),
        ));
  }
}

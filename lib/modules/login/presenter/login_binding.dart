import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pay_flow/core/external/drivers/hasura_driver.dart';
import 'package:pay_flow/modules/login/domain/usecases/save_user_usecase/save_user_usecase.dart';
import 'package:pay_flow/modules/login/external/drivers/google_sign_in_driver.dart';
import 'package:pay_flow/modules/login/infra/repositories/get_user_repository.dart';
import 'package:pay_flow/modules/login/infra/repositories/save_user_repository.dart';
import 'package:pay_flow/modules/login/presenter/login_controller.dart';

import '../domain/usecases/get_user_usecase/get_user_usecase.dart';
import '../domain/usecases/login_with_google_usecase/login_with_google_usecase.dart';
import '../external/datasources/get_user_hasura_datasource.dart';
import '../external/datasources/save_user_hasura_datasource.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(GoogleSignIn());
    Get.put(GoogleSignInDriver(Get.find<GoogleSignIn>()));

    Get.put(SaveUserHasuraDatasource(Get.find<HasuraDriver>()));
    Get.put(GetUserHasuraDatasource(Get.find<HasuraDriver>()));

    Get.put(SaveUserRepository(Get.find<SaveUserHasuraDatasource>()));
    Get.put(GetUserRepository(Get.find<GetUserHasuraDatasource>()));

    Get.put(LoginWithGoogleUsecase(Get.find<GoogleSignInDriver>()));
    Get.put(SaveUserUsecase(Get.find<SaveUserRepository>()));
    Get.put(GetUserUsecase(Get.find<GetUserRepository>()));

    Get.put(LoginController(
      Get.find<LoginWithGoogleUsecase>(),
      Get.find<SaveUserUsecase>(),
      Get.find<GetUserUsecase>(),
    ));
  }
}

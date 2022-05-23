import 'package:get/get.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:pay_flow/core/external/drivers/hasura_driver.dart';

import 'app_controller.dart';
import '../configs/environments.dart';

class AppInjection implements Bindings {
  @override
  void dependencies() {
    Get.put(
      HasuraConnect(
        Environments.hasuraUrl,
        headers: {
          'content-type': 'application/json',
          'x-hasura-admin-secret': Environments.hasuraAdminSecret,
        },
      ),
    );
    Get.put(HasuraDriver(Get.find<HasuraConnect>()));
    Get.put(AppController(), permanent: true);
  }
}

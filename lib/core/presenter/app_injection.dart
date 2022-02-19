import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:pay_flow/core/external/drivers/hasura_driver.dart';

import 'app_controller.dart';

class AppInjection implements Bindings {
  @override
  void dependencies() {
    Get.put(
      HasuraConnect(
        dotenv.get('HASURA_URL'),
        headers: {
          'content-type': 'application/json',
          'x-hasura-admin-secret': dotenv.get('HASURA_ADMIN_SECRET'),
        },
      ),
    );
    Get.put(HasuraDriver(Get.find<HasuraConnect>()));
    Get.put(AppController(), permanent: true);
  }
}

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:hasura_connect/hasura_connect.dart';

import '../domain/usecases/get_ticket_usecase/get_ticket_usecase.dart';
import '../domain/usecases/get_user_usecase/get_user_usecase.dart';
import '../domain/usecases/save_ticket_usecase/save_ticket_usecase.dart';
import '../infra/services/hasura_service.dart';
import 'app_controller.dart';

class AppInjection implements Bindings {
  @override
  void dependencies() {
    Get.put(AppController(), permanent: true);
    Get.put(
      HasuraConnect(
        dotenv.get('HASURA_URL'),
        headers: {
          'content-type': 'application/json',
          'x-hasura-admin-secret': dotenv.get('HASURA_ADMIN_SECRET'),
        },
      ),
      permanent: true,
    );
    Get.lazyPut(() => HasuraService(Get.find<HasuraConnect>()));
    Get.lazyPut(() => GetTicketUsecase());
    Get.lazyPut(() => SaveTicketUsecase());
    Get.lazyPut(() => GetUserUsecase());
  }
}

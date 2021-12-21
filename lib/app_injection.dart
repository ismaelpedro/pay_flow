import 'package:get/get.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:pay_flow/app_controller.dart';

import 'app_constants.dart';
import 'domain/usecases/get_ticket_usecase/get_ticket_usecase.dart';
import 'domain/usecases/get_user_usecase/get_user_usecase.dart';
import 'domain/usecases/save_ticket_usecase/save_ticket_usecase.dart';
import 'infra/services/hasura/hasura_service.dart';

class AppInjection implements Bindings {
  @override
  void dependencies() {
    Get.put(() => AppController(), permanent: true);
    Get.lazyPut(() => HasuraConnect(
          AppConstants.hasuraApi,
          headers: AppConstants.hasuraHeaders,
        ));
    Get.lazyPut(() => HasuraService(Get.find<HasuraConnect>()));
    Get.lazyPut(() => GetTicketUsecase());
    Get.lazyPut(() => SaveTicketUsecase());
    Get.lazyPut(() => GetUserUsecase());
  }
}

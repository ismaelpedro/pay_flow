import 'package:get/get.dart';
import 'package:pay_flow/core/external/drivers/hasura_driver.dart';
import 'package:pay_flow/modules/home/external/datasources/get_tickets_hasura_datasource.dart';
import 'package:pay_flow/modules/home/infra/repositories/get_tickets_repository.dart';

import '../domain/usecases/delete_ticket_usecase/delete_ticket_usecase.dart';
import '../domain/usecases/get_tickets_usecase/get_tickets_usecase.dart';
import '../infra/repositories/delete_ticket_repository.dart';
import 'home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetTicketsHasuraDatasource(Get.find<HasuraDriver>()));
    Get.lazyPut(
        () => GetTicketsRepository(Get.find<GetTicketsHasuraDatasource>()));
    Get.lazyPut(() => DeleteTicketRepository());
    Get.lazyPut(() => GetTicketsUsecase(Get.find<GetTicketsRepository>()));
    Get.lazyPut(() => DeleteTicketUsecase(Get.find<DeleteTicketRepository>()));
    Get.lazyPut(
      () => HomeController(
          Get.find<GetTicketsUsecase>(), Get.find<DeleteTicketUsecase>()),
    );
  }
}

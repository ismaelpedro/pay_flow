import 'package:get/get.dart';
import 'package:pay_flow/domain/usecases/get_ticket_from_hasura_usecase/get_ticket_from_hasura_usecase.dart';
import 'package:pay_flow/presenter/modules/home/presenter/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(Get.find<GetTicketFromHasuraUsecase>()));
  }
}

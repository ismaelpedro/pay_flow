import 'package:get/get.dart';
import 'ticket_form_controller.dart';

class TicketFormBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TicketFormController());
  }
}

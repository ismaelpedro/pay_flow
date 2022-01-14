import 'package:get/get.dart';

import 'domain/entities/ticket.dart';
import 'domain/entities/user.dart';

class AppController extends GetxController {
  late User currentUser;
  var tickets = <Ticket>[].obs;
}

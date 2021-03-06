import 'package:get/get.dart';

import '../domain/entities/ticket_entity.dart';
import '../domain/entities/user_entity.dart';

class AppController extends GetxController {
  late UserEntity currentUser;
  var tickets = <TicketEntity>[].obs;

  final isDarkMode = false.obs;
}

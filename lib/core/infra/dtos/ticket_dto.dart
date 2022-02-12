import 'package:get/get.dart';
import 'package:pay_flow/core/presenter/app_controller.dart';
import 'package:uuid/uuid.dart';
import '../../domain/entities/ticket_entity.dart';

extension TicketDto on TicketEntity {
  Map<String, dynamic> toJson() {
    return {
      'id': const Uuid().v4(),
      'name': name,
      'date': date,
      'code': code,
      'value': value,
      'fkUser': Get.find<AppController>().currentUser.id,
    };
  }

  static TicketEntity fromJson(Map<String, dynamic> map) {
    return TicketEntity(
      id: map['id'],
      name: map['name'],
      date: map['date'],
      code: map['code'],
      value: map['value'],
      fkUser: map['fkUser'],
    );
  }
}

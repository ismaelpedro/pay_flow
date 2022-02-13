import '../../domain/entities/ticket_entity.dart';

extension TicketDto on TicketEntity {
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'date': date,
      'code': code,
      'value': value,
      'fkUser': fkUser
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

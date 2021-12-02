import 'dart:convert';

import 'package:pay_flow/domain/entities/ticket_entity.dart';

class TicketDto extends TicketEntity {
  final String idDto;
  final String nameDto;
  final String dateDto;
  final String codeDto;
  final String fkUserDto;

  TicketDto({
    required this.idDto,
    required this.nameDto,
    required this.dateDto,
    required this.codeDto,
    required this.fkUserDto,
  }) : super(
          id: idDto,
          name: nameDto,
          date: dateDto,
          code: codeDto,
          fkUser: fkUserDto,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'date': date,
      'code': code,
      'fkUser': fkUser,
    };
  }

  @override
  String toString() {
    return 'TicketDto(id: $id, name: $name, date: $date, code: $code, fkUser: $fkUser)';
  }

  factory TicketDto.fromMap(Map<String, dynamic> map) {
    return TicketDto(
      idDto: map['id'],
      nameDto: map['name'],
      dateDto: map['date'],
      codeDto: map['code'],
      fkUserDto: map['fkUser'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TicketDto.fromJson(String source) =>
      TicketDto.fromMap(json.decode(source));
}

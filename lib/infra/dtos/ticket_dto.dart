import 'dart:convert';
import '../../domain/entities/ticket_entity.dart';

class TicketDto extends TicketEntity {
  final String idDto;
  final String titleDto;
  final String dateDto;
  final String codeDto;
  final String fkUserDto;
  final String valueDto;

  TicketDto({
    required this.idDto,
    required this.titleDto,
    required this.dateDto,
    required this.codeDto,
    required this.valueDto,
    required this.fkUserDto,
  }) : super(
          id: idDto,
          name: titleDto,
          date: dateDto,
          code: codeDto,
          value: valueDto,
          fkUser: fkUserDto,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': titleDto,
      'date': dateDto,
      'code': codeDto,
      'fkUser': fkUserDto,
    };
  }

  @override
  String toString() {
    return 'TicketDto(id: $id, title: $titleDto, date: $date, code: $code, fkUser: $fkUser)';
  }

  factory TicketDto.fromMap(Map<String, dynamic> map) {
    return TicketDto(
      idDto: map['id'],
      titleDto: map['title'],
      dateDto: map['date'],
      codeDto: map['code'],
      valueDto: map['value'],
      fkUserDto: map['fkUser'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TicketDto.fromJson(String source) =>
      TicketDto.fromMap(json.decode(source));
}

import 'dart:convert';
import '../../domain/entities/ticket_entity.dart';

class TicketDto extends TicketEntity {
  final String? idDto;
  final String nameDto;
  final String dateDto;
  final String codeDto;
  final String fkUserDto;
  final double valueDto;

  TicketDto({
    this.idDto,
    required this.nameDto,
    required this.dateDto,
    required this.codeDto,
    required this.valueDto,
    required this.fkUserDto,
  }) : super(
          name: nameDto,
          date: dateDto,
          code: codeDto,
          value: valueDto,
          fkUser: fkUserDto,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': idDto,
      'name': nameDto,
      'date': dateDto,
      'code': codeDto,
      'value': valueDto,
      'fkUser': fkUserDto,
    };
  }

  @override
  String toString() {
    return 'TicketDto(id: $id, name: $nameDto, date: $date, code: $code, fkUser: $fkUser)';
  }

  factory TicketDto.fromMap(Map<String, dynamic> map) {
    return TicketDto(
      idDto: map['id'],
      nameDto: map['name'],
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

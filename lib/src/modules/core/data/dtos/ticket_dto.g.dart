// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TicketDto _$$_TicketDtoFromJson(Map<String, dynamic> json) => _$_TicketDto(
      id: json['id'] as String,
      name: json['name'] as String,
      date: json['date'] as String,
      code: json['code'] as String,
      value: json['value'] as String,
      fkUser: json['fkUser'] as String,
    );

Map<String, dynamic> _$$_TicketDtoToJson(_$_TicketDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'date': instance.date,
      'code': instance.code,
      'value': instance.value,
      'fkUser': instance.fkUser,
    };

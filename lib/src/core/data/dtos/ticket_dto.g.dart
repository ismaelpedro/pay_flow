// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TicketDtoImpl _$$TicketDtoImplFromJson(Map<String, dynamic> json) =>
    _$TicketDtoImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      date: json['date'] as String,
      code: json['code'] as String,
      value: (json['value'] as num).toDouble(),
      fkUser: json['fkUser'] as String,
    );

Map<String, dynamic> _$$TicketDtoImplToJson(_$TicketDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'date': instance.date,
      'code': instance.code,
      'value': instance.value,
      'fkUser': instance.fkUser,
    };

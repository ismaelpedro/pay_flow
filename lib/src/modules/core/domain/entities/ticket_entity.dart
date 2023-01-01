import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_entity.freezed.dart';

@freezed
class TicketEntity with _$TicketEntity {
  factory TicketEntity({
    String? id,
    String? name,
    String? date,
    String? code,
    double? value,
    String? fkUser,
  }) = _TicketEntity;
}

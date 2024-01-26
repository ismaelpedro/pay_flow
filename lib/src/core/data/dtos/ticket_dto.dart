import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/ticket_entity.dart';

part 'ticket_dto.freezed.dart';
part 'ticket_dto.g.dart';

@freezed
class TicketDto with _$TicketDto {
  const TicketDto._();

  factory TicketDto({
    String? id,
    String? name,
    required String date,
    required String code,
    required double value,
    required String fkUser,
  }) = _TicketDto;

  factory TicketDto.fromJson(Map<String, dynamic> json) => _$TicketDtoFromJson(json);

  /// Convert [TicketDto] to [TicketEntity] entity
  TicketEntity toEntity() => TicketEntity(
        id: id,
        name: name,
        date: date,
        code: code,
        value: value,
        fkUser: fkUser,
      );
}

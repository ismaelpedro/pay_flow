import 'package:pay_flow/core/domain/entities/ticket_entity.dart';

abstract class ITicketDatasource {
  Future<TicketEntity> saveTicket();
  Future<TicketEntity> getTicket();
  Future<TicketEntity> removeTicket();
}

import '../../../domain/entities/ticket_entity.dart';

abstract class ITicketDatasource {
  Future<TicketEntity> getTicket();
  Future<void> saveTicket();
  Future<void> deleteTicket();
}

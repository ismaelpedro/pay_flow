import '../../entities/ticket_entity.dart';

abstract class ITicketRepository {
  Future<TicketEntity> getTicket();
  Future<TicketEntity> saveTicket();
  Future<TicketEntity> deleteTicket();
}

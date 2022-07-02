import '../entities/ticket_entity.dart';

abstract class ITicketRepository {
  Future<TicketEntity> getTicket();
  Future<void> saveTicket();
  Future<void> deleteTicket();
}

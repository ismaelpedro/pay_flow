import 'package:dartz/dartz.dart';
import 'package:pay_flow/domain/entities/ticket_entity.dart';

abstract class ITicketRepository {
  Future<Either<Exception, TicketEntity>>? saveTicket(TicketEntity ticket);
  Future<Either<Exception, TicketEntity>>? getTickets();
}

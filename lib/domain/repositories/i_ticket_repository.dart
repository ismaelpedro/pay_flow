import 'package:dartz/dartz.dart';
import 'package:pay_flow/infra/dtos/ticket_dto.dart';

abstract class ITicketRepository {
  Future<Either<Exception, TicketDto>>? saveTicket(TicketDto ticket);
  Future<Either<Exception, TicketDto>>? getTickets();
}

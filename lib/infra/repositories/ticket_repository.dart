import 'package:dartz/dartz.dart';
import 'package:pay_flow/domain/entities/ticket_entity.dart';
import 'package:pay_flow/domain/repositories/i_ticket_repository.dart';

class TicketRepository implements ITicketRepository {
  @override
  Future<Either<Exception, TicketEntity>>? getTickets() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, TicketEntity>>? saveTicket(TicketEntity ticket) {
    throw UnimplementedError();
  }
}

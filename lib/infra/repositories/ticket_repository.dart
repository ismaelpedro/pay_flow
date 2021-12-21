import 'package:dartz/dartz.dart';
import 'package:pay_flow/domain/repositories/i_ticket_repository.dart';
import 'package:pay_flow/infra/dtos/ticket_dto.dart';

class TicketRepository implements ITicketRepository {
  @override
  Future<Either<Exception, TicketDto>>? getTickets() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, TicketDto>>? saveTicket(TicketDto ticket) {
    throw UnimplementedError();
  }
}

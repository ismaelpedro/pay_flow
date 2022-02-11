import 'package:dartz/dartz.dart';

import '../../domain/entities/ticket_entity.dart';
import '../../domain/interfaces/repositories/i_ticket_repository.dart';

class TicketRepository implements ITicketRepository {
  @override
  Future<Either<Exception, TicketEntity>> getTickets() {
    throw UnimplementedError();
  }
}

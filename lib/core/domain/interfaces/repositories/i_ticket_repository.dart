import 'package:dartz/dartz.dart';
import '../../entities/ticket_entity.dart';

abstract class ITicketRepository {
  Future<Either<Exception, TicketEntity>>? getTickets();
}

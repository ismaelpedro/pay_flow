import 'package:dartz/dartz.dart';
import 'package:pay_flow/infra/dtos/ticket_dto.dart';

abstract class ISaveTicketRepository {
  Future<Either<Exception, TicketDto>>? call();
}

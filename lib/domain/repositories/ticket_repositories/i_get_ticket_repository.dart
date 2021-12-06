import 'package:dartz/dartz.dart';
import 'package:pay_flow/infra/dtos/ticket_dto.dart';

abstract class IGetTicketRepository {
  Future<Either<Exception, TicketDto>>? call();
}

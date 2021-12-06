import 'package:dartz/dartz.dart';
import 'package:pay_flow/domain/repositories/ticket_repositories/i_get_ticket_repository.dart';
import 'package:pay_flow/infra/dtos/ticket_dto.dart';

class GetTicketRepository implements IGetTicketRepository {
  @override
  Future<Either<Exception, TicketDto>>? call() {}
}

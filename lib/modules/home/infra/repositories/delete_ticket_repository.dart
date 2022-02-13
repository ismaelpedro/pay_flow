import 'package:dartz/dartz.dart';
import 'package:pay_flow/core/domain/entities/ticket_entity.dart';

import '../../domain/interfaces/repositories/i_delete_ticket_repository.dart';

class DeleteTicketRepository implements IDeleteTicketRepository {
  @override
  Future<Either<Exception, List<TicketEntity>>> call() {
    throw UnimplementedError();
  }
}

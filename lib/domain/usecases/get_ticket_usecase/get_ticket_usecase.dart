import 'package:dartz/dartz.dart';
import 'package:pay_flow/domain/entities/ticket_entity.dart';
import 'package:pay_flow/domain/exceptions/hasura_exception.dart';

import 'i_get_ticket_usecase.dart';

class GetTicketUsecase implements IGetTicketUsecase {
  @override
  Future<Either<HasuraException, TicketEntity>> call() {
    throw UnimplementedError();
  }
}

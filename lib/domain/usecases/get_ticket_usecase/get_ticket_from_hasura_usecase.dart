import 'package:pay_flow/infra/dtos/ticket_dto.dart';
import 'package:dartz/dartz.dart';

import 'i_get_ticket_from_hasura_usecase.dart';

class GetTicketFromHasuraUsecase implements IGetTicketFromHasuraUsecase {
  @override
  Future<Either<Exception, TicketDto>?> call() async {}
}

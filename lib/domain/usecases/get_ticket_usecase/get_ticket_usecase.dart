import 'package:dartz/dartz.dart';

import '../../../infra/dtos/ticket_dto.dart';
import 'i_get_ticket_usecase.dart';

class GetTicketUsecase implements IGetTicketUsecase {
  @override
  Future<Either<Exception, TicketDto>?> call() async {}
}

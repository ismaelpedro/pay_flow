import 'package:dartz/dartz.dart';

import '../../../infra/dtos/ticket_dto.dart';

abstract class IGetTicketUsecase {
  Future<Either<Exception, TicketDto>?> call();
}

import 'package:dartz/dartz.dart';

import '../../entities/ticket_entity.dart';
import '../../exceptions/hasura_exception.dart';

abstract class IGetTicketUsecase {
  Future<Either<HasuraException, TicketEntity>> call();
}

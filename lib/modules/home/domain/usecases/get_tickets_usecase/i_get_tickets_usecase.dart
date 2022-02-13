import 'package:dartz/dartz.dart';

import '../../../../../core/domain/entities/ticket_entity.dart';

abstract class IGetTicketsUsecase {
  Future<Either<Exception, List<TicketEntity>>> call(String id);
}

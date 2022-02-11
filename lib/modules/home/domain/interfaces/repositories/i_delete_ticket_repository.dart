import 'package:dartz/dartz.dart';

import '../../../../../core/domain/entities/ticket_entity.dart';

abstract class IDeleteTicketRepository {
  Future<Either<Exception, List<TicketEntity>>> call();
}

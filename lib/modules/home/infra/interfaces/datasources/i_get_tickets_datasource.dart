import 'package:dartz/dartz.dart';
import 'package:pay_flow/core/domain/entities/ticket_entity.dart';

import '../../../../../core/domain/exceptions/hasura_exception.dart';

abstract class IGetTicketsDatasource {
  Future<Either<HasuraException, List<TicketEntity>>> call(String id);
}

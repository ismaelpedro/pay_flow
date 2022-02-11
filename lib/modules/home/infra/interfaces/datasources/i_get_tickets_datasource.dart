import 'package:dartz/dartz.dart';
import 'package:pay_flow/core/domain/entities/ticket_entity.dart';

abstract class IGetTicketsDatasource {
  Future<Either<Exception, List<TicketEntity>>> call();
}

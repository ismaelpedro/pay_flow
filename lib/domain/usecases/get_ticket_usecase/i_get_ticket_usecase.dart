import 'package:dartz/dartz.dart';
import 'package:pay_flow/domain/entities/ticket_entity.dart';
import 'package:pay_flow/domain/exceptions/hasura_exception.dart';

abstract class IGetTicketUsecase {
  Future<Either<HasuraException, TicketEntity>> call();
}

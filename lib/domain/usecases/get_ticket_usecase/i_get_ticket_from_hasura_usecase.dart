import 'package:dartz/dartz.dart';
import 'package:pay_flow/infra/dtos/ticket_dto.dart';

abstract class IGetTicketFromHasuraUsecase {
  Future<Either<Exception, TicketDto>?> call();
}

import 'package:dartz/dartz.dart';
import 'package:pay_flow/core/domain/entities/ticket_entity.dart';

import 'i_save_ticket_usecase.dart';

class SaveTicketUsecase implements ISaveTicketUsecase {
  @override
  Future<Either<Exception, TicketEntity>> call() {
    throw UnimplementedError();
  }
}

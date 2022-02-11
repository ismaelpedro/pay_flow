import 'package:dartz/dartz.dart';
import 'package:pay_flow/modules/ticket_form/domain/interfaces/repositories/i_get_tickets_repository.dart';

import '../../../../../core/domain/entities/ticket_entity.dart';
import 'i_get_tickets_usecase.dart';

class GetTicketsUsecase implements IGetTicketsUsecase {
  final IGetTicketsRepository _repository;
  GetTicketsUsecase(this._repository);

  @override
  Future<Either<Exception, List<TicketEntity>>> call() async {
    return await _repository();
  }
}

import 'package:dartz/dartz.dart';

import '../../../../../core/domain/entities/ticket_entity.dart';
import '../../interfaces/repositories/i_delete_ticket_repository.dart';
import 'i_delete_ticket_usecase.dart';

class DeleteTicketUsecase implements IDeleteTicketUsecase {
  final IDeleteTicketRepository _repository;
  DeleteTicketUsecase(this._repository);

  @override
  Future<Either<Exception, List<TicketEntity>>> call() async {
    return await _repository();
  }
}

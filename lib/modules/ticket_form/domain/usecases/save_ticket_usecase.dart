import 'package:pay_flow/core/domain/entities/ticket_entity.dart';
import 'package:pay_flow/core/domain/interfaces/repositories/ticket_repository.dart';

class SaveTicketUsecase {
  final ITicketRepository _repository;
  SaveTicketUsecase(this._repository);

  Future<TicketEntity> call() async {
    throw Exception();
  }
}

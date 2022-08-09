
import '../../../core/domain/domain.dart';

class SaveTicketUsecase {
  final ITicketRepository _repository;
  SaveTicketUsecase(this._repository);

  Future<void> call() async {
    return await _repository.saveTicket();
  }
}

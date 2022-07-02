import '../../domain/entities/ticket_entity.dart';
import '../../domain/repositories/i_ticket_repository.dart';
import '../datasources/ticket_datasource/i_ticket_datasource.dart';

class TicketRepository implements ITicketRepository {
  final ITicketDatasource _datasource;
  TicketRepository(this._datasource);

  @override
  Future<void> deleteTicket() async {
    throw UnimplementedError();
  }

  @override
  Future<TicketEntity> getTicket() async {
    throw UnimplementedError();
  }

  @override
  Future<void> saveTicket() async {
    return await _datasource.saveTicket();
  }
}

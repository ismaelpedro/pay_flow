import '../../../domain/entities/ticket_entity.dart';
import 'i_ticket_datasource.dart';

class TicketDatasource implements ITicketDatasource {
  @override
  Future<TicketEntity> getTicket() async {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTicket() async {
    throw UnimplementedError();
  }

  @override
  Future<void> saveTicket() async {
    throw UnimplementedError();
  }
}

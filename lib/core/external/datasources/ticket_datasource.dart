import 'package:pay_flow/core/domain/entities/ticket_entity.dart';
import 'package:pay_flow/core/infra/interfaces/datasources/i_ticket_datasource.dart';

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

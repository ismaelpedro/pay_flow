import 'package:dartz/dartz.dart';

import '../../../../core/domain/entities/ticket_entity.dart';
import '../../../ticket_form/domain/interfaces/repositories/i_get_tickets_repository.dart';
import '../interfaces/datasources/i_get_tickets_datasource.dart';

class GetTicketsRepository implements IGetTicketsRepository {
  final IGetTicketsDatasource _datasource;
  GetTicketsRepository(this._datasource);

  @override
  Future<Either<Exception, List<TicketEntity>>> call(String id) async {
    return await _datasource(id);
  }
}

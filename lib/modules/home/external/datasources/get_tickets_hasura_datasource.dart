import 'package:dartz/dartz.dart';
import 'package:pay_flow/core/domain/entities/ticket_entity.dart';
import 'package:pay_flow/core/infra/interfaces/drivers/i_hasura_driver.dart';

import '../../infra/interfaces/datasources/i_get_tickets_datasource.dart';

class GetTicketsHasuraDatasource implements IGetTicketsDatasource {
  final IHasuraDriver _hasuraDriver;
  GetTicketsHasuraDatasource(this._hasuraDriver);

  @override
  Future<Either<Exception, List<TicketEntity>>> call() async {
    throw UnimplementedError();
  }
}

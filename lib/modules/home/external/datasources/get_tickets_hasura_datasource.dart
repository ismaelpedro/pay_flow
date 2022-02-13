import 'package:dartz/dartz.dart';
import 'package:pay_flow/core/domain/entities/ticket_entity.dart';
import 'package:pay_flow/core/domain/exceptions/hasura_exception.dart';
import 'package:pay_flow/core/infra/interfaces/drivers/i_hasura_driver.dart';

import '../../infra/interfaces/datasources/i_get_tickets_datasource.dart';

class GetTicketsHasuraDatasource implements IGetTicketsDatasource {
  final IHasuraDriver _hasuraDriver;
  GetTicketsHasuraDatasource(this._hasuraDriver);

  @override
  Future<Either<HasuraException, List<TicketEntity>>> call(String id) async {
    final response = await _hasuraDriver.query(
      ''' 
      query {
        tickets((where: {fkUser: {_eq: "$id"}}}) {
          code
          date
          fkUser
          id
          name
          value
        }
      }
      ''',
    );

    if (response['data']['tickets'] != null) {
      return const Right(<TicketEntity>[]);
    }
    return const Left(HasuraException());
  }
}

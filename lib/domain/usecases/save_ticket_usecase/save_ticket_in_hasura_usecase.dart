import 'package:hasura_connect/hasura_connect.dart';
import 'package:pay_flow/infra/dtos/user_dto.dart';
import 'package:dartz/dartz.dart';

import 'i_save_ticket_in_hasura_usecase.dart';

class SaveTicketInHasuraUsecase implements ISaveTicketInHasuraUsecase {
  final HasuraConnect _hasuraConnect;
  SaveTicketInHasuraUsecase(this._hasuraConnect);

  @override
  Future<Either<Exception, UserDto>?> call() async {}
}

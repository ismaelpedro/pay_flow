import 'package:hasura_connect/hasura_connect.dart';
import 'package:pay_flow/domain/usecases/save_ticket_in_hasura_usecase/i_save_ticket_in_hasura_usecase.dart';
import 'package:pay_flow/infra/dtos/user_dto.dart';
import 'package:dartz/dartz.dart';

class SaveTicketInHasuraUsecase implements ISaveTicketInHasuraUsecase {
  HasuraConnect _hasuraConnect;
  SaveTicketInHasuraUsecase(this._hasuraConnect);

  @override
  Future<Either<Exception, UserDto>?> call() async {}
}

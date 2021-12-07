import 'package:hasura_connect/hasura_connect.dart';
import 'package:pay_flow/infra/dtos/user_dto.dart';
import 'package:dartz/dartz.dart';

import 'i_get_user_from_hasura.dart';

class GetUserFromHasuraUsecase implements IGetUserFromHasuraUsecase {
  final HasuraConnect _hasuraConnect;
  GetUserFromHasuraUsecase(this._hasuraConnect);

  @override
  Future<Either<Exception, UserDto>?> call() async {}
}

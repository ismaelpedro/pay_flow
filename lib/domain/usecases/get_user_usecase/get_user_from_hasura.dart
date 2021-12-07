import 'package:pay_flow/infra/dtos/user_dto.dart';
import 'package:dartz/dartz.dart';

import 'i_get_user_from_hasura.dart';

class GetUserFromHasuraUsecase implements IGetUserFromHasuraUsecase {
  @override
  Future<Either<Exception, UserDto>?> call() async {}
}

import 'package:dartz/dartz.dart';

import '../../../infra/dtos/user_dto.dart';

abstract class ISaveUserInHasuraUsecase {
  Future<Either<Exception, UserDto>?> call(UserDto user);
}

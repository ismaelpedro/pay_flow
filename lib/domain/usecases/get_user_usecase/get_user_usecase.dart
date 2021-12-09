import 'package:pay_flow/infra/dtos/user_dto.dart';
import 'package:dartz/dartz.dart';

import 'i_get_user_usecase.dart';


class GetUserUsecase implements IGetUserUsecase {
  @override
  Future<Either<Exception, UserDto>?> call() async {}
}

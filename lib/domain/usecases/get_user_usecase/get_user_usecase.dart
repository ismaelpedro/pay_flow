import 'package:pay_flow/domain/entities/user_entity.dart';
import 'package:pay_flow/domain/exceptions/hasura_exception.dart';
import 'package:dartz/dartz.dart';

import 'i_get_user_usecase.dart';

class GetUserUsecase implements IGetUserUsecase {
  @override
  Future<Either<HasuraException, UserEntity>> call() {
    throw UnimplementedError();
  }
}

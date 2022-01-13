import 'package:pay_flow/domain/entities/user.dart';
import 'package:pay_flow/domain/exceptions/hasura_exception.dart';
import 'package:dartz/dartz.dart';

import 'i_get_user_usecase.dart';

class GetUserUsecase implements IGetUserUsecase {
  @override
  Future<Either<HasuraException, User>> call() {
    throw UnimplementedError();
  }
}

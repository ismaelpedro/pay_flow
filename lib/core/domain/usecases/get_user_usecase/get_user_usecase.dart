import 'package:dartz/dartz.dart';

import '../../entities/user_entity.dart';
import '../../exceptions/hasura_exception.dart';
import 'i_get_user_usecase.dart';

class GetUserUsecase implements IGetUserUsecase {
  @override
  Future<Either<HasuraException, UserEntity>> call() {
    throw UnimplementedError();
  }
}

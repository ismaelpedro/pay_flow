import 'package:dartz/dartz.dart';

import '../../entities/user_entity.dart';
import '../../exceptions/hasura_exception.dart';

abstract class IUserRepository {
  Future<Either<HasuraException, UserEntity>> saveUser(UserEntity user);
  Future<Either<HasuraException, UserEntity>> getUser();
}

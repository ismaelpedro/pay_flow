import 'package:dartz/dartz.dart';

import '../entities/user.dart';
import '../exceptions/hasura_exception.dart';

abstract class IUserRepository {
  Future<Either<HasuraException, User>> saveUser(User user);
  Future<Either<HasuraException, User>> getUser();
}

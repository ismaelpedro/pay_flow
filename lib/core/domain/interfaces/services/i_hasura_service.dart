import 'package:dartz/dartz.dart';

import '../../entities/user_entity.dart';
import '../../exceptions/hasura_exception.dart';

abstract class IHasuraService {
  Future<Either<HasuraException, UserEntity>> mutation(String mutation);
  Future<Either<HasuraException, UserEntity>> query(String query);
}

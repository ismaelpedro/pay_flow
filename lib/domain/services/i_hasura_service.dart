import 'package:dartz/dartz.dart';

import '../entities/user.dart';
import '../exceptions/hasura_exception.dart';

abstract class IHasuraService {
  Future<Either<HasuraException, User>> mutation(String mutation);
  Future<Either<HasuraException, User>> query(String query);
}

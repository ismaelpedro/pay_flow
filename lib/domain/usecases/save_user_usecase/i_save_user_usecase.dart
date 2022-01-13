import 'package:dartz/dartz.dart';

import '../../entities/user.dart';
import '../../exceptions/hasura_exception.dart';

abstract class ISaveUserUsecase {
  Future<Either<HasuraException, User>> call(User user);
}

import 'package:dartz/dartz.dart';

import '../../entities/user_entity.dart';
import '../../exceptions/hasura_exception.dart';

abstract class ISaveTicketUsecase {
  Future<Either<HasuraException, UserEntity>> call();
}

import 'package:dartz/dartz.dart';

import '../../entities/user.dart';
import '../../exceptions/hasura_exception.dart';

abstract class ISaveTicketUsecase {
  Future<Either<HasuraException, User>> call();
}

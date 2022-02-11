import 'package:dartz/dartz.dart';

import '../../entities/user_entity.dart';
import '../../exceptions/hasura_exception.dart';
import 'i_save_ticket_usecase.dart';

class SaveTicketUsecase implements ISaveTicketUsecase {
  @override
  Future<Either<HasuraException, UserEntity>> call() {
    throw UnimplementedError();
  }
}

import 'package:dartz/dartz.dart';
import 'package:pay_flow/core/domain/entities/user_entity.dart';
import 'package:pay_flow/modules/login/domain/exceptions/login_exception.dart';

import '../../domain/interfaces/repositories/i_save_user_repository.dart';

class SaveUserRepository implements ISaveUserRepository {
  @override
  Future<Either<LoginException, UserEntity>> call() {
    throw UnimplementedError();
  }
}

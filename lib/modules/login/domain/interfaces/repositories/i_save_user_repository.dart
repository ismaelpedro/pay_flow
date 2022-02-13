import 'package:dartz/dartz.dart';
import 'package:pay_flow/core/domain/entities/user_entity.dart';
import 'package:pay_flow/modules/login/domain/exceptions/login_exception.dart';

abstract class ISaveUserRepository {
  Future<Either<LoginException, UserEntity>> call(UserEntity user);
}

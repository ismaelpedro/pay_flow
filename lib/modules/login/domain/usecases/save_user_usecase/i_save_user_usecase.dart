import 'package:dartz/dartz.dart';
import 'package:pay_flow/core/domain/entities/user_entity.dart';

abstract class ISaveUserUsecase {
  Future<Either<Exception, UserEntity>> call(UserEntity user);
}

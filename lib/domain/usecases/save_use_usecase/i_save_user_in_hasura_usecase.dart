import 'package:dartz/dartz.dart';
import 'package:pay_flow/domain/entities/user_entity.dart';

abstract class ISaveUserInHasuraUsecase {
  Future<Either<Exception, UserEntity>?> call(UserEntity user);
}

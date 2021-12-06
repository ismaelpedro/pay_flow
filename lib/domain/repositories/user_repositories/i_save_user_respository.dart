import 'package:dartz/dartz.dart';
import 'package:pay_flow/infra/dtos/user_dto.dart';

abstract class ISaveUserRepository {
  Future<Either<Exception, UserDto>>? call();
}

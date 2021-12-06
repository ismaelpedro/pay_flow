import 'package:dartz/dartz.dart';
import 'package:pay_flow/domain/repositories/user_repositories/i_get_user_repository.dart';
import 'package:pay_flow/infra/dtos/user_dto.dart';

class GetUserRepository implements IGetUserRepository {
  @override
  Future<Either<Exception, UserDto>>? call() {}
}

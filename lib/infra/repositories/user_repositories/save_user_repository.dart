import 'package:dartz/dartz.dart';
import 'package:pay_flow/domain/repositories/user_repositories/i_save_user_respository.dart';
import 'package:pay_flow/infra/dtos/user_dto.dart';

class SaveUserRepository implements ISaveUserRepository {
  @override
  Future<Either<Exception, UserDto>>? call() {}
}

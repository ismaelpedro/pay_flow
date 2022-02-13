import 'package:dartz/dartz.dart';
import 'package:pay_flow/modules/login/domain/interfaces/repositories/i_get_user_repository.dart';

import '../../../../../core/domain/entities/user_entity.dart';
import 'i_get_user_usecase.dart';

class GetUserUsecase implements IGetUserUsecase {
  final IGetUserRepository _repository;
  GetUserUsecase(this._repository);

  @override
  Future<Either<Exception, UserEntity?>> call(String id) async {
    return await _repository(id);
  }
}

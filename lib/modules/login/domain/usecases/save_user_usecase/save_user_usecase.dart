import 'package:dartz/dartz.dart';
import 'package:pay_flow/modules/login/domain/interfaces/repositories/i_save_user_repository.dart';

import '../../../../../core/domain/entities/user_entity.dart';
import '../../../../../core/domain/usecases/save_user_usecase/i_save_user_usecase.dart';

class SaveUserUsecase implements ISaveUserUsecase {
  final ISaveUserRepository _repository;
  SaveUserUsecase(this._repository);

  @override
  Future<Either<Exception, UserEntity>> call(UserEntity user) async {
    return await _repository(user);
  }
}

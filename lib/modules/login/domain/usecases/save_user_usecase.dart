import '../../../../core/domain/interfaces/repositories/user_repository.dart';

import '../../../../core/domain/entities/user_entity.dart';

class SaveUserUsecase {
  final IUserRepository _repository;
  SaveUserUsecase(this._repository);

  Future<UserEntity?> call(UserEntity user) async {
    await _repository.saveUser();
    return null;
  }
}

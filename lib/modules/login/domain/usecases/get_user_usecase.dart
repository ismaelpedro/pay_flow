import '../../../../core/domain/interfaces/repositories/user_repository.dart';

import '../../../../core/domain/entities/user_entity.dart';

class GetUserUsecase {
  final IUserRepository _repository;
  GetUserUsecase(this._repository);

  Future<UserEntity?> call(String id) async {
      return await _repository.getUser(id);
  }
}

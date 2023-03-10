

import '../../../../core/domain/domain.dart';

class GetUserUsecase {
  final IUserRepository _repository;
  GetUserUsecase(this._repository);

  Future<UserEntity?> call(String id) async {
      return await _repository.getUser(id);
  }
}

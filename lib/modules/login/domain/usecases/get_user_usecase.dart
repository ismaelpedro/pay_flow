
import '../../../../core/domain/entities/user_entity.dart';
import '../../../../core/domain/repositories/i_user_repository.dart';

class GetUserUsecase {
  final IUserRepository _repository;
  GetUserUsecase(this._repository);

  Future<UserEntity?> call(String id) async {
      return await _repository.getUser(id);
  }
}

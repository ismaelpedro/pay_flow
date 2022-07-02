import '../../../../core/domain/entities/user_entity.dart';
import '../../../../core/domain/repositories/i_user_repository.dart';

class SaveUserUsecase {
  final IUserRepository _repository;
  SaveUserUsecase(this._repository);

  Future<UserEntity?> call(UserEntity user) async {
    await _repository.saveUser();
    return null;
  }
}

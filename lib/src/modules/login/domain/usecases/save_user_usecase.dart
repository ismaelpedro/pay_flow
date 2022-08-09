
import '../../../core/domain/domain.dart';

class SaveUserUsecase {
  final IUserRepository _repository;
  SaveUserUsecase(this._repository);

  Future<UserEntity?> call(UserEntity user) async {
    await _repository.saveUser();
    return null;
  }
}

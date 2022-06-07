import '../../interfaces/repositories/i_save_user_repository.dart';
import 'i_save_user_usecase.dart';

import '../../../../../core/domain/entities/user_entity.dart';
import '../../exceptions/login_exception.dart';

class SaveUserUsecase implements ISaveUserUsecase {
  final ISaveUserRepository _repository;
  SaveUserUsecase(this._repository);

  @override
  Future<UserEntity?> call(UserEntity user) async {
    try {
      return await _repository(user);
    } catch (e) {
      throw const LoginException();
    }
  }
}

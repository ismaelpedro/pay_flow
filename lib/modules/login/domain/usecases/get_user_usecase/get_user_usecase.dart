import 'package:pay_flow/modules/login/domain/exceptions/login_exception.dart';
import 'package:pay_flow/modules/login/domain/interfaces/repositories/i_get_user_repository.dart';

import '../../../../../core/domain/entities/user_entity.dart';
import 'i_get_user_usecase.dart';

class GetUserUsecase implements IGetUserUsecase {
  final IGetUserRepository _repository;
  GetUserUsecase(this._repository);

  @override
  Future<UserEntity?> call(String id) async {
    try {
      return await _repository(id);
    } catch (e) {
      throw const LoginException();
    }
  }
}

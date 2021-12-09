import 'package:dartz/dartz.dart';
import 'package:pay_flow/domain/repositories/i_user_repository.dart';

import '../../entities/user.dart';
import 'i_save_user_usecase.dart';

class SaveUserUsecase implements ISaveUserUsecase {
  IUserRepository repository;
  SaveUserUsecase(this.repository);

  @override
  Future<Either<Exception, User>?> call(User user) async {
    try {
      await repository.saveUser(user);
    } catch (e) {
      Exception('$e');
    }
  }
}

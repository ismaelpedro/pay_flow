import 'package:dartz/dartz.dart';

import '../../entities/user.dart';
import '../../exceptions/hasura_exception.dart';
import '../../repositories/i_user_repository.dart';
import 'i_save_user_usecase.dart';

class SaveUserUsecase implements ISaveUserUsecase {
  IUserRepository repository;
  SaveUserUsecase(this.repository);

  @override
  Future<Either<HasuraException, User>> call(User user) async {
    final responseUser = await repository.saveUser(user);
    return responseUser.fold(
      (exception) => Left(exception),
      (user) => Right(user),
    );
  }
}

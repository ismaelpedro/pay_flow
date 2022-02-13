import 'package:dartz/dartz.dart';
import 'package:pay_flow/core/domain/entities/user_entity.dart';
import 'package:pay_flow/modules/login/domain/exceptions/login_exception.dart';

import '../../domain/interfaces/repositories/i_save_user_repository.dart';
import '../interfaces/datasources/i_save_user_datasource.dart';

class SaveUserRepository implements ISaveUserRepository {
  final ISaveUserDatasource _datasource;
  SaveUserRepository(this._datasource);

  @override
  Future<Either<LoginException, UserEntity>> call(UserEntity user) async {
    return await _datasource(user);
  }
}

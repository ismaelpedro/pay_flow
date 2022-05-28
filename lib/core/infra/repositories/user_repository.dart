import 'package:pay_flow/core/domain/entities/user_entity.dart';

import '../../domain/interfaces/repositories/user_repository.dart';
import '../interfaces/datasources/i_user_datasource.dart';

class UserRepository implements IUserRepository {
  final IUserDatasource _datasource;
  UserRepository(this._datasource);

  @override
  Future<void> saveUser() async {
    return await _datasource.saveUser();
  }

  @override
  Future<UserEntity> getUser() async {
    throw UnimplementedError();
  }
}

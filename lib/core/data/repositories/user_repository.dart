import '../../domain/entities/user_entity.dart';

import '../../domain/repositories/i_user_repository.dart';
import '../datasources/user_datasource/i_user_datasource.dart';

class UserRepository implements IUserRepository {
  final IUserDatasource _datasource;
  UserRepository(this._datasource);

  @override
  Future<void> saveUser() async {
    return await _datasource.saveUser();
  }

  @override
  Future<UserEntity> getUser(String id) async {
    throw UnimplementedError();
  }
}

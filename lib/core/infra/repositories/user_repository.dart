import 'package:pay_flow/core/domain/entities/user_entity.dart';

import '../../domain/interfaces/repositories/user_repository.dart';
import '../interfaces/datasources/i_user_datasource.dart';

class UserRepository implements IUserRepository {
  final IUserDatasource _datasource;
  UserRepository(this._datasource);

  @override
  Future<UserEntity> deleteUser() async {
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> getUser() async {
    throw UnimplementedError();
  }
}

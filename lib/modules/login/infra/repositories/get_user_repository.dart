import '../../../../core/domain/entities/user_entity.dart';

import '../../domain/interfaces/repositories/i_get_user_repository.dart';
import '../interfaces/datasources/i_get_user_datasource.dart';

class GetUserRepository implements IGetUserRepository {
  final IGetUserDatasource _datasource;
  GetUserRepository(this._datasource);

  @override
  Future<UserEntity?> call(String id) async {
    return await _datasource(id);
  }
}

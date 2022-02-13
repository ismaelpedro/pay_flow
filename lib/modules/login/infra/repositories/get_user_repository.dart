import 'package:dartz/dartz.dart';
import 'package:pay_flow/core/domain/entities/user_entity.dart';
import 'package:pay_flow/modules/login/domain/exceptions/login_exception.dart';

import '../../domain/interfaces/repositories/i_get_user_repository.dart';
import '../interfaces/datasources/i_get_user_hasura_datasource.dart';

class GetUserRepository implements IGetUserRepository {
  final IGetUserDatasource _datasource;
  GetUserRepository(this._datasource);

  @override
  Future<Either<LoginException, UserEntity>> call(String id) async {
    return await _datasource(id);
  }
}

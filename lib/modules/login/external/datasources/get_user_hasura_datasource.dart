import 'package:dartz/dartz.dart';
import 'package:pay_flow/core/domain/entities/user_entity.dart';
import 'package:pay_flow/core/infra/interfaces/drivers/i_hasura_driver.dart';
import 'package:pay_flow/modules/login/domain/exceptions/login_exception.dart';
import 'package:pay_flow/modules/login/infra/interfaces/datasources/i_get_user_hasura_datasource.dart';

import '../../../../core/infra/dtos/user_dto.dart';

class GetUserDatasource implements IGetUserDatasource {
  final IHasuraDriver _hasuraDriver;
  GetUserDatasource(this._hasuraDriver);

  @override
  Future<Either<LoginException, UserEntity>> call(String id) async {
    try {
      final response = await _hasuraDriver.query(
        '''
        query {
          users_by_pk(id: $id) {
            id
            email
            imageUrl
            name
          }
        }
        ''',
      );
      if (response['data']['users_by_pk'] != null) {
        return Right(UserDto.fromJson(response['data']['users_by_pk']));
      }
      return const Left(LoginException());
    } catch (e) {
      return const Left(LoginException());
    }
  }
}

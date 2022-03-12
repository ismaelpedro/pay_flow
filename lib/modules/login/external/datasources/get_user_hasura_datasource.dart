import 'package:pay_flow/core/domain/entities/user_entity.dart';
import 'package:pay_flow/core/infra/interfaces/drivers/i_hasura_driver.dart';
import 'package:pay_flow/modules/login/infra/interfaces/datasources/i_get_user_datasource.dart';

import '../../../../core/infra/dtos/user_dto.dart';

class GetUserHasuraDatasource implements IGetUserDatasource {
  final IHasuraDriver _hasuraDriver;
  GetUserHasuraDatasource(this._hasuraDriver);

  @override
  Future<UserEntity?> call(String id) async {
    final response = await _hasuraDriver.query(
      '''
        query {
          users_by_pk(id: "$id") {
            id
            email
            imageUrl
            name
          }
        }
        ''',
    );
    if (response['data']['users_by_pk'] != null) {
      return UserDto.fromJson(response['data']['users_by_pk']);
    }
    return null;
  }
}

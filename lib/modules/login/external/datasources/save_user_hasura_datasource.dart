import '../../../../core/domain/entities/user_entity.dart';
import '../../../../core/infra/interfaces/drivers/i_hasura_driver.dart';

import '../../../../core/infra/dtos/user_dto.dart';
import '../../infra/interfaces/datasources/i_save_user_datasource.dart';

class SaveUserHasuraDatasource implements ISaveUserDatasource {
  final IHasuraDriver _hasuraDriver;
  SaveUserHasuraDatasource(this._hasuraDriver);

  @override
  Future<UserEntity?> call(UserEntity user) async {
    final Map<String, Map> response = await _hasuraDriver.mutation(
      '''
      mutation MyMutation {
        insert_users_one(object: {email: "${user.email}", id: "${user.id}", imageUrl: "${user.imageUrl}", name: "${user.name}"}) {
          email
          id
          imageUrl
          name
        }
      }
      ''',
    );

    if (response['data']?['insert_users_one'] != null) {
      return UserDto.fromJson(response['data']?['insert_users_one']);
    }
    return null;
  }
}

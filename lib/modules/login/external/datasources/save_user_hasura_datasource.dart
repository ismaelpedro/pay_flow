import 'package:dartz/dartz.dart';
import 'package:pay_flow/core/domain/entities/user_entity.dart';
import 'package:pay_flow/core/infra/interfaces/drivers/i_hasura_driver.dart';
import 'package:pay_flow/modules/login/domain/exceptions/login_exception.dart';

import '../../../../core/infra/dtos/user_dto.dart';
import '../../infra/interfaces/datasources/i_save_user_datasource.dart';

class SaveUserHasuraDatasource implements ISaveUserDatasource {
  final IHasuraDriver _hasuraDriver;
  SaveUserHasuraDatasource(this._hasuraDriver);

  @override
  Future<Either<LoginException, UserEntity>> call(UserEntity user) async {
    final response = await _hasuraDriver.mutation(
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

    if (response['data']['insert_users_one'] != null) {
      return Right(UserDto.fromJson(response['data']['insert_users_one']));
    }
    return const Left(LoginException());
  }
}

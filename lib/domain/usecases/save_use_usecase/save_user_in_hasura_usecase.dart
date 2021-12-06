import 'package:hasura_connect/hasura_connect.dart';
import 'package:pay_flow/infra/dtos/user_dto.dart';
import 'package:dartz/dartz.dart';
import 'i_save_user_in_hasura_usecase.dart';

class SaveUserInHasuraUsecase implements ISaveUserInHasuraUsecase {
  final HasuraConnect _hasura;
  SaveUserInHasuraUsecase(this._hasura);

  @override
  Future<Either<Exception, UserDto>?> call(UserDto userDto) async {
    try {
      await _hasura.mutation(
        '''
        mutation {
          insert_users_one(object: {
            email: "${userDto.emailDto}", 
            id: "${userDto.idDto}", 
            imageUrl: "${userDto.imageUrlDto}", 
            name: "${userDto.name}"}) {
              email
              id
              imageUrl
              name
          }
        }
    ''',
      );
    } catch (e) {
      Exception('$e');
    }
  }
}

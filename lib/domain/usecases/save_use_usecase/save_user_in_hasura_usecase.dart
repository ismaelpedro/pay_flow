import 'package:hasura_connect/hasura_connect.dart';
import 'package:pay_flow/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'i_save_user_in_hasura_usecase.dart';

class SaveUserInHasuraUsecase implements ISaveUserInHasuraUsecase {
  final HasuraConnect _hasura;
  SaveUserInHasuraUsecase(this._hasura);

  @override
  Future<Either<Exception, UserEntity>?> call(UserEntity user) async {
    try {
      await _hasura.mutation(
        '''
        mutation {
          insert_users_one(object: {
            email: "${user.email}", 
            id: "${user.id}", 
            imageUrl: "${user.imageUrl}", 
            name: "${user.name}"}) {
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

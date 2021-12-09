import 'package:dartz/dartz.dart';

import '../../entities/user_entity.dart';
import '../../repositories/user_repositories/i_save_user_respository.dart';
import 'i_save_user_in_hasura_usecase.dart';

class SaveUserUsecase implements ISaveUserUsecase {
  ISaveUserRepository repository;
  SaveUserUsecase(this.repository);

  @override
  Future<Either<Exception, UserEntity>?> call(UserEntity user) async {
    try {
      await repository(
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

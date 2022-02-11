import 'package:dartz/dartz.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/exceptions/hasura_exception.dart';
import '../../domain/interfaces/repositories/i_user_repository.dart';
import '../../domain/interfaces/services/i_hasura_service.dart';

class UserRepository implements IUserRepository {
  IHasuraService service;
  UserRepository(this.service);

  @override
  Future<Either<HasuraException, UserEntity>> saveUser(UserEntity user) async {
    final response = await service.mutation(
      '''
        mutation {
          insert_users_one(object: {
            id: "${user.id}", 
            email: "${user.email}", 
            name: "${user.name}", 
            imageUrl: "${user.imageUrl}"}) {
              id
              name
              email
              imageUrl
          }
        }
        ''',
    );

    return response.fold(
      (exception) => Left(exception),
      (user) => Right(user),
    );
  }

  @override
  Future<Either<HasuraException, UserEntity>> getUser() {
    throw UnimplementedError();
  }
}

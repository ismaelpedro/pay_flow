import 'package:dartz/dartz.dart';

import '../../domain/entities/user.dart';
import '../../domain/exceptions/hasura_exception.dart';
import '../../domain/repositories/i_user_repository.dart';
import '../../domain/services/i_hasura_service.dart';

class UserRepository implements IUserRepository {
  IHasuraService service;
  UserRepository(this.service);

  @override
  Future<Either<HasuraException, User>> saveUser(User user) async {
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
  Future<Either<HasuraException, User>> getUser() {
    throw UnimplementedError();
  }
}

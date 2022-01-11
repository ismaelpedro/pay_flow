import 'dart:developer';
import '../../domain/entities/user.dart';
import '../../domain/repositories/i_user_repository.dart';
import '../../domain/repositories/i_hasura_service.dart';

class UserRepository implements IUserRepository {
  IHasuraService service;
  UserRepository(this.service);

  @override
  Future<void> saveUser(User user) async {
    try {
      await service.mutation(
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
    } catch (e) {
      log('$e');
    }
  }

  @override
  Future<void> getUser() {
    throw UnimplementedError();
  }
}

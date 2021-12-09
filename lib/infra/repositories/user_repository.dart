import 'dart:developer';

import '../../domain/entities/user.dart';
import '../../domain/repositories/i_user_repository.dart';
import '../services/hasura/i_hasura_service.dart';

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
      log('$e');
    }
  }

  @override
  Future<void> getUser() {
    throw UnimplementedError();
  }
}

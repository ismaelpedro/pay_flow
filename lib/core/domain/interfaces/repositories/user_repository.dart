import '../../entities/user_entity.dart';

abstract class IUserRepository {
  Future<UserEntity> getUser(String id);
  Future<void> saveUser();
}

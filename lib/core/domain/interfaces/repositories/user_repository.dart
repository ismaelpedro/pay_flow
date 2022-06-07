import '../../entities/user_entity.dart';

abstract class IUserRepository {
  Future<UserEntity> getUser();
  Future<void> saveUser();
}

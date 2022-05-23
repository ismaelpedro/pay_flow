import 'package:pay_flow/core/domain/entities/user_entity.dart';

abstract class IUserRepository {
  Future<UserEntity> getUser();
  Future<UserEntity> deleteUser();
}

import 'package:pay_flow/core/domain/entities/user_entity.dart';

abstract class IUserDatasource {
  Future<void> saveUser();
  Future<UserEntity> getUser();
}

import '../../../../../core/domain/entities/user_entity.dart';

abstract class IGetUserRepository {
  Future<UserEntity?> call(String id);
}

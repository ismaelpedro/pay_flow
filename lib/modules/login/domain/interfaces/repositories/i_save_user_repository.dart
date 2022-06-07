import '../../../../../core/domain/entities/user_entity.dart';

abstract class ISaveUserRepository {
  Future<UserEntity?> call(UserEntity user);
}

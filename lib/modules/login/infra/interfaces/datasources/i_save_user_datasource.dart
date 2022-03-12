import '../../../../../core/domain/entities/user_entity.dart';

abstract class ISaveUserDatasource {
  Future<UserEntity?> call(UserEntity user);
}

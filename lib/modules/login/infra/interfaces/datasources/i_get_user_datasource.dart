import '../../../../../core/domain/entities/user_entity.dart';

abstract class IGetUserDatasource {
  Future<UserEntity?> call(String id);
}

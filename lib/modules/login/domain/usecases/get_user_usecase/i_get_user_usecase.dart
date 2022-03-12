import '../../../../../core/domain/entities/user_entity.dart';

abstract class IGetUserUsecase {
  Future<UserEntity?> call(String id);
}

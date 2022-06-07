import '../../../../../core/domain/entities/user_entity.dart';

abstract class ISaveUserUsecase {
  Future<UserEntity?> call(UserEntity user);
}

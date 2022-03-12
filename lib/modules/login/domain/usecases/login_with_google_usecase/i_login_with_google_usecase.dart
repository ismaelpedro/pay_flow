import '../../../../../core/domain/entities/user_entity.dart';

abstract class ILoginWithGoogleUsecase {
  Future<UserEntity?> call();
}

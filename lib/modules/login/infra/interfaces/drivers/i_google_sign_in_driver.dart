import '../../../../../core/domain/entities/user_entity.dart';

abstract class IGoogleSignInDriver {
  Future<UserEntity?> signIn();
  Future<void> signOut();
}

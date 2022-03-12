import '../../../../../core/domain/entities/user_entity.dart';

abstract class IGoogleSignInService {
  Future<UserEntity?> signIn();
  Future<void> signOut();
}

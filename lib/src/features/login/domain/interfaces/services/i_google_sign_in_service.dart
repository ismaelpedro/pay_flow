import '../../../../../core/domain/domain.dart';

abstract class IGoogleSignInService {
  Future<UserEntity?> signIn();
  Future<void> signOut();
}

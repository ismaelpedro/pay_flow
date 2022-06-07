import '../../../../core/domain/entities/user_entity.dart';

import '../../domain/interfaces/services/i_google_sign_in_service.dart';
import '../interfaces/drivers/i_google_sign_in_driver.dart';

class GoogleSignInService implements IGoogleSignInService {
  final IGoogleSignInDriver _googleSignIn;
  GoogleSignInService(this._googleSignIn);

  @override
  Future<UserEntity?> signIn() async {
    final googleAccount = await _googleSignIn.signIn();

    if (googleAccount != null) {
      final user = UserEntity(
        id: googleAccount.id,
        name: googleAccount.displayName!,
        email: googleAccount.email,
        imageUrl: googleAccount.photoUrl,
      );
      return user;
    }
    return null;
  }

  @override
  Future<void> signOut() async {
    await _googleSignIn.signOut();
  }
}

import 'package:google_sign_in/google_sign_in.dart';
import 'package:pay_flow/core/domain/entities/user_entity.dart';

import '../../infra/interfaces/drivers/i_google_sign_in_driver.dart';

class GoogleSignInDriver implements IGoogleSignInDriver {
  final GoogleSignIn _googleSignIn;
  GoogleSignInDriver(this._googleSignIn);

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

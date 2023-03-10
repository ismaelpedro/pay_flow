import 'package:google_sign_in/google_sign_in.dart';
import '../../core.dart';

class GoogleSignInAdapter {
  final GoogleSignIn _googleSignIn;
  GoogleSignInAdapter(this._googleSignIn);

  Future<UserEntity?> signIn() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    if (googleUser != null) {
      return UserEntity(
        id: googleUser.id,
        name: googleUser.displayName!,
        email: googleUser.email,
        imageUrl: googleUser.photoUrl!,
      );
    }
    return null;
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
  }
}

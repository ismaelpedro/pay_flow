import 'package:google_sign_in/google_sign_in.dart';
import '../../domain/entities/user_entity.dart';

abstract class SigInAdapter {
  Future<UserEntity?> signIn();
  Future<void> signOut();
}

class GoogleSignInAdapter implements SigInAdapter {
  final GoogleSignIn _googleSignIn;
  GoogleSignInAdapter(this._googleSignIn);

  @override
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

  @override
  Future<void> signOut() async {
    await _googleSignIn.signOut();
  }
}

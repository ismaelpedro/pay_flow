import 'package:pay_flow/src/core/core.dart';

import 'i_google_sign_in_service.dart';

class GoogleSignInService implements IGoogleSignInService {
  final GoogleSignInAdapter? googleSignIn;
  GoogleSignInService(this.googleSignIn);

  @override
  Future<UserEntity?> signIn() async {
    googleSignIn?.signOut();
    final user = await googleSignIn?.signIn();
    return user;
  }

  @override
  Future<void> signOut() async {
    await googleSignIn?.signOut();
  }
}

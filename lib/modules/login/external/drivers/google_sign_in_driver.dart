import 'package:google_sign_in/google_sign_in.dart';
import '../../infra/interfaces/drivers/i_google_sign_in_driver.dart';

class GoogleSignInDriver implements IGoogleSignInDriver {
  final GoogleSignIn _googleSignIn;
  GoogleSignInDriver(this._googleSignIn);

  @override
  Future<GoogleSignInAccount?> signIn() async {
    return await _googleSignIn.signIn();
  }

  @override
  Future<GoogleSignInAccount?> signOut() async {
    return await _googleSignIn.signOut();
  }
}

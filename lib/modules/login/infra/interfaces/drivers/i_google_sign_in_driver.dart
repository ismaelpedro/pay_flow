import 'package:google_sign_in/google_sign_in.dart';

abstract class IGoogleSignInDriver {
  Future<GoogleSignInAccount?> signIn();
  Future<GoogleSignInAccount?> signOut();
}

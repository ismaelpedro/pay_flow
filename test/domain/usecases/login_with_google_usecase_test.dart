import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sign_in_mocks/google_sign_in_mocks.dart';

main() {
  late MockGoogleSignIn _googleSignIn;

  setUp(() {
    _googleSignIn = MockGoogleSignIn();
  });

  test('Should return a GoogleSignInAccount', () async {
    final _signInAccount = await _googleSignIn.signIn();
    expect(_signInAccount, isA<GoogleSignInAccount>());
  });
  test('Should return null when login is cancelled', () async {
    _googleSignIn.setIsCancelled(true);
    final _signInAccount = await _googleSignIn.signIn();
    expect(_signInAccount, isNull);
  });
  test('Should return idToken when authenticating', () async {
    final _signInAccount = await _googleSignIn.signIn();
    final _signInAuthentication = await _signInAccount!.authentication;
    expect(_signInAuthentication.idToken, isNotNull);
  });
  test('Should return accessToken when authenticating', () async {
    final _signInAccount = await _googleSignIn.signIn();
    final _signInAuthentication = await _signInAccount!.authentication;
    expect(_signInAuthentication.accessToken, isNotNull);
  });
}

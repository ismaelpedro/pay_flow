import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pay_flow/domain/exceptions/login_exception.dart';
import 'package:pay_flow/domain/services/i_google_sign_in_service.dart';

class GoogleSignInService implements IGoogleSignInService {
  final GoogleSignIn _googleSignIn;
  GoogleSignInService(this._googleSignIn);

  @override
  Future<Either<LoginException, GoogleSignInAccount?>> signIn() async {
    try {
      final response = await _googleSignIn.signIn();
      return Right(response);
    } catch (e) {
      return const Left(LoginException());
    }
  }

  @override
  Future<void> signOut() async {
    await _googleSignIn.signOut();
  }
}

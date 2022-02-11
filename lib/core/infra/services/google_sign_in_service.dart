import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../modules/login/domain/exceptions/login_exception.dart';
import '../../domain/interfaces/services/i_google_sign_in_service.dart';

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

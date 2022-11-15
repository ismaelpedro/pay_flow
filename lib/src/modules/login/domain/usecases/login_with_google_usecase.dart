import '../../../core/domain/domain.dart';
import '../../../core/infrastructure/google_sign_in/google_sign_in_adapter.dart';

class LoginWithGoogleUsecase {
  final GoogleSignInAdapter _googleSignService;
  LoginWithGoogleUsecase(this._googleSignService);

  Future<UserEntity?> call() async {
    UserEntity? userGoogleSignIn = await _googleSignService.signIn();
    return userGoogleSignIn;
  }
}

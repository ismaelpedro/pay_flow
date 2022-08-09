import '../../../core/domain/domain.dart';
import '../interfaces/services/i_google_sign_in_service.dart';

class LoginWithGoogleUsecase {
  final IGoogleSignInService _googleSignService;
  LoginWithGoogleUsecase(this._googleSignService);

  Future<UserEntity?> call() async {
    UserEntity? userGoogleSignIn = await _googleSignService.signIn();
    return userGoogleSignIn;
  }
}

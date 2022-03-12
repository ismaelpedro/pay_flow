import 'package:pay_flow/modules/login/domain/exceptions/login_exception.dart';

import '../../../../../core/domain/entities/user_entity.dart';
import '../../interfaces/services/i_google_sign_in_service.dart';
import 'i_login_with_google_usecase.dart';

class LoginWithGoogleUsecase implements ILoginWithGoogleUsecase {
  final IGoogleSignInService _googleSignService;
  LoginWithGoogleUsecase(this._googleSignService);

  @override
  Future<UserEntity?> call() async {
    try {
      await _googleSignService.signOut();
      final userGoogleSignIn = await _googleSignService.signIn();
      return userGoogleSignIn;
    } catch (e) {
      throw const LoginException();
    }
  }
}

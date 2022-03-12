import 'package:pay_flow/modules/login/domain/exceptions/login_exception.dart';

import '../../../../../core/domain/entities/user_entity.dart';
import '../../../infra/interfaces/drivers/i_google_sign_in_driver.dart';
import 'i_login_with_google_usecase.dart';

class LoginWithGoogleUsecase implements ILoginWithGoogleUsecase {
  final IGoogleSignInDriver _googleSignInDriver;
  LoginWithGoogleUsecase(this._googleSignInDriver);

  @override
  Future<UserEntity?> call() async {
    try {
      await _googleSignInDriver.signOut();
      final userGoogleSignIn = await _googleSignInDriver.signIn();
      return userGoogleSignIn;
    } catch (e) {
      throw const LoginException();
    }
  }
}

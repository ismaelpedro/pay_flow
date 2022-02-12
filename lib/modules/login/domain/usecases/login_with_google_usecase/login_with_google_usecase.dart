import 'package:dartz/dartz.dart';
import 'package:pay_flow/modules/login/external/drivers/google_sign_in_driver.dart';

import '../../../../../core/domain/entities/user_entity.dart';
import '../../exceptions/login_exception.dart';
import 'i_login_with_google_usecase.dart';

class LoginWithGoogleUsecase implements ILoginWithGoogleUsecase {
  final GoogleSignInDriver _googleSignInDriver;
  LoginWithGoogleUsecase(this._googleSignInDriver);

  @override
  Future<Either<LoginException, UserEntity>> call() async {
    await _googleSignInDriver.signOut();
    final userGoogleSignIn = await _googleSignInDriver.signIn();

    return userGoogleSignIn.fold(
      (exception) => Left(exception),
      (user) {
        if (user != null) {
          return Right(user);
        }
        return const Left(LoginException());
      },
    );
  }
}

import 'package:dartz/dartz.dart';

import '../../../../../core/domain/entities/user_entity.dart';
import '../../../infra/interfaces/drivers/i_google_sign_in_driver.dart';
import '../../exceptions/login_exception.dart';
import 'i_login_with_google_usecase.dart';

class LoginWithGoogleUsecase implements ILoginWithGoogleUsecase {
  final IGoogleSignInDriver _googleSignInDriver;
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

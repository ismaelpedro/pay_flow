import 'package:dartz/dartz.dart';

import '../../../infra/services/google_sign_in_service.dart';
import '../../entities/user_entity.dart';
import '../../exceptions/login_exception.dart';
import 'i_login_with_google_usecase.dart';

class LoginWithGoogleUsecase implements ILoginWithGoogleUsecase {
  final GoogleSignInService _googleSignIn;
  LoginWithGoogleUsecase(this._googleSignIn);

  @override
  Future<Either<LoginException, UserEntity>> call() async {
    await _googleSignIn.signOut();
    final userGoogleSignIn = await _googleSignIn.signIn();

    return userGoogleSignIn.fold(
      (exception) => Left(exception),
      (googleUser) {
        if (googleUser != null) {
          final user = UserEntity(
            id: googleUser.id,
            name: googleUser.displayName ?? '',
            imageUrl: googleUser.photoUrl,
            email: googleUser.email,
          );
          return Right(user);
        }
        return const Left(LoginException());
      },
    );
  }
}

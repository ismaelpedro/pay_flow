import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../presenter/config/app_routes.dart';
import '../../entities/user_entity.dart';
import 'i_login_with_google_usecase.dart';

class LoginWithGoogleUsecase implements ILoginWithGoogleUsecase {
  final GoogleSignIn _googleSignIn;
  LoginWithGoogleUsecase(this._googleSignIn);

  @override
  Future<Either<Exception, UserEntity>?> call() async {
    try {
      await _googleSignIn.signOut();
      final userGoogleSignIn = await _googleSignIn.signIn();

      if (userGoogleSignIn != null) {
        final user = UserEntity(
          id: userGoogleSignIn.id,
          name: userGoogleSignIn.displayName!,
          imageUrl: userGoogleSignIn.photoUrl,
          email: userGoogleSignIn.email,
        );
        Get.toNamed(Routes.home, arguments: user);

        return Right(user);
      }
    } catch (e) {
      return Left(Exception('$e'));
    }
  }
}

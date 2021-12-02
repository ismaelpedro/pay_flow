import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../infra/dtos/user_dto.dart';
import '../../../presenter/config/app_routes.dart';
import 'i_login_with_google_usecase.dart';

class LoginWithGoogleUsecase implements ILoginWithGoogleUsecase {
  final GoogleSignIn _googleSignIn;
  LoginWithGoogleUsecase(this._googleSignIn);

  @override
  Future<Either<Exception, UserDto>?> call() async {
    try {
      await _googleSignIn.signOut();
      final userGoogleSignIn = await _googleSignIn.signIn();

      if (userGoogleSignIn != null) {
        final user = UserDto(
          idDto: userGoogleSignIn.id,
          nameDto: userGoogleSignIn.displayName!,
          imageUrlDto: userGoogleSignIn.photoUrl,
          emailDto: userGoogleSignIn.email,
        );
        log('$user');
        Get.toNamed(Routes.home, arguments: user);

        return Right(user);
      }
    } catch (e) {
      return Left(Exception('$e'));
    }
  }
}

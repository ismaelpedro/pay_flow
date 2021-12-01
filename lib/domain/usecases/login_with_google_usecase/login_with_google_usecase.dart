import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:pay_flow/infra/dtos/user_dto.dart';
import 'package:pay_flow/presenter/config/app_routes.dart';
import 'i_login_with_google_usecase.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginWithGoogleUsecase implements ILoginWithGoogleUsecase {
  @override
  Future<Either<Exception, UserDto>?> call() async {
    try {
      final googleSignIn = GoogleSignIn();
      await googleSignIn.signOut();
      final userGoogle = await googleSignIn.signIn();

      if (userGoogle != null) {
        final user = UserDto(
          idDto: userGoogle.id,
          nameDto: userGoogle.displayName!,
          imageUrlDto: userGoogle.photoUrl,
          emailDto: userGoogle.email,
        );
        log('$user');
        Get.toNamed(Routes.home, arguments: user);
        return Right(user);
      } else {
        return null;
      }
    } catch (e) {
      return Left(Exception('$e'));
    }
  }
}

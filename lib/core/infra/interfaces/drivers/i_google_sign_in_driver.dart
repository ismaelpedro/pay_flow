import 'package:dartz/dartz.dart';

import '../../../../modules/login/domain/exceptions/login_exception.dart';

abstract class IGoogleSignInDriver {
  Future<Either<LoginException, dynamic>> signIn();
  Future<void> signOut();
}

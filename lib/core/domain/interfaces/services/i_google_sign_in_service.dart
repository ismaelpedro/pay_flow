import 'package:dartz/dartz.dart';
import '../../../../modules/login/domain/exceptions/login_exception.dart';

abstract class IGoogleSignInService {
  Future<Either<LoginException, dynamic>> signIn();
  Future<void> signOut();
}

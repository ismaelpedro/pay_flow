import 'package:dartz/dartz.dart';
import 'package:pay_flow/domain/exceptions/login_exception.dart';

abstract class IGoogleSignInService {
  Future<Either<LoginException, dynamic>> signIn();
  Future<void> signOut();
}

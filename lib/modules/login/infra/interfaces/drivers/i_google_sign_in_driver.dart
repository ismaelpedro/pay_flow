import 'package:dartz/dartz.dart';

import '../../../domain/exceptions/login_exception.dart';
import '../../../../../core/domain/entities/user_entity.dart';

abstract class IGoogleSignInDriver {
  Future<Either<LoginException, UserEntity?>> signIn();
  Future<void> signOut();
}

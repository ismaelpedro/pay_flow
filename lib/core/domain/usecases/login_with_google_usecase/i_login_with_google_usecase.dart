import 'package:dartz/dartz.dart';

import '../../entities/user_entity.dart';
import '../../../../modules/login/domain/exceptions/login_exception.dart';

abstract class ILoginWithGoogleUsecase {
  Future<Either<LoginException, UserEntity>> call();
}
